<div class="container-xl">
    <!-- Page title -->
    <div class="page-header d-print-none">
        <div class="row align-items-center">
            <div class="col">
                <h2 class="page-title">
                    {{#if system.isadmin}}
                        Points
                    {{else}}
                        My points
                    {{/if}}
                </h2>
            </div>
            <div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                    {{#if system.isadmin}}
                        <div class="form-group">
                            <a href="javascript:;" class="btn btn-primary /*d-none d-sm-inline-block*/" onclick="View.openFormPointsAdd();">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <line x1="12" y1="5" x2="12" y2="19" />
                                    <line x1="5" y1="12" x2="19" y2="12" />
                                </svg>
                                Add points
                            </a>
                        </div>
                    {{else}}
                    {{/if}}
                    
                    <div class="form-group" style="max-width: 140px;">
                            <div class="input-icon">
                              <span class="input-icon-addon"><!-- Download SVG icon from http://tabler-icons.io/i/calendar -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><rect x="4" y="5" width="16" height="16" rx="2"></rect><line x1="16" y1="3" x2="16" y2="7"></line><line x1="8" y1="3" x2="8" y2="7"></line><line x1="4" y1="11" x2="20" y2="11"></line><line x1="11" y1="15" x2="12" y2="15"></line><line x1="12" y1="15" x2="12" y2="18"></line></svg>
                              </span>
                              <input id="points_date_of" class="form-control" placeholder="00/00/0000" inputmode="numeric" data-inputmask="'alias': 'datetime', 'inputFormat': 'dd/mm/yyyy', 'outputFormat': 'ddmmyyyy'" value="01/{{system.curMonth}}/{{system.curYear}}">
                            </div>
                            </div>
                            <div class="form-group" style="max-width: 140px;">
                            <div class="input-icon">
                              <span class="input-icon-addon"><!-- Download SVG icon from http://tabler-icons.io/i/calendar -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><rect x="4" y="5" width="16" height="16" rx="2"></rect><line x1="16" y1="3" x2="16" y2="7"></line><line x1="8" y1="3" x2="8" y2="7"></line><line x1="4" y1="11" x2="20" y2="11"></line><line x1="11" y1="15" x2="12" y2="15"></line><line x1="12" y1="15" x2="12" y2="18"></line></svg>
                              </span>
                              <input id="points_date_until" class="form-control" placeholder="00/00/0000" inputmode="numeric" data-inputmask="'alias': 'datetime', 'inputFormat': 'dd/mm/yyyy', 'outputFormat': 'ddmmyyyy'" value="{{system.lastDayOfMonth}}/{{system.curMonth}}/{{system.curYear}}">
                            </div>
                        </div>
                    
                    <!--
                    <div class="form-group" style="/*max-width: 140px;*/">
                        <div class="form-group">
                            <div id="extract_unilevel--btn-group" class="btn-group w-100">
                                <button type="button" class="btn btn-primary" data-tab="*">Todos</button>
                                <button type="button" class="btn" data-tab="active">Ativos</button>
                                <button type="button" class="btn" data-tab="inactive">Inativos</button>
                            </div>
                            <script>
                                if (typeof page__extract_unilevel__buttons === 'undefined') {
                                    let page__extract_unilevel__buttons = document.querySelectorAll('#extract_unilevel--btn-group .btn');
                                    for(let i = 0; i<page__extract_unilevel__buttons.length; i++){
                                        page__extract_unilevel__buttons[i].addEventListener('click', () => {
                                            var btnLst = document.querySelectorAll('#extract_unilevel--btn-group .btn');
                                            for(var i2 = 0; i2<btnLst.length; i2++){
                                                if (page__extract_unilevel__buttons[i].getAttribute("data-tab") == btnLst[i2].getAttribute("data-tab")) {
                                                    page__extract_unilevel__buttons[i].classList.add("btn-primary");
                                                } else {
                                                    btnLst[i2].classList.remove("btn-primary");
                                                }
                                            }
                                            
                                            fc_pointsGetAll(page__extract_unilevel__buttons[i].getAttribute("data-tab"));
                                        });
                                    }
                                }
                            </script>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page-body">
    <!-- -->
</div>

<script>
    var elDate_of = document.getElementById("points_date_of");
    var elDate_until = document.getElementById("points_date_until");
    
    elDate_of.addEventListener("keyup", function(event) {
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13) {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            fc_pointsGetAll("*");
        }
    });
    
    elDate_until.addEventListener("keyup", function(event) {
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13) {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            fc_pointsGetAll("*");
        }
    });
    
    
    function fc_pointsGetAll(status = "", listType){
        document.querySelector(".page-body").innerHTML = 
              '<div class="empty">'
            + '    <p class="empty-title"><div class="spinner-grow" role="status"></div></p>'
            + '</div>';
        
        $.ajax({
            type: 'GET',
            url: CFG__API_URL + CFG__API_VERSION + "/points?date_of="+FormatStringDate(elDate_of.value)+"&date_until="+FormatStringDate(elDate_until.value),
            data: {},
            beforeSend: function (xhr){ 
                xhr.setRequestHeader('Authorization', cookieGet('__utmo'));
            },
            success: function(response) {
                if (response.success === true) {
                    var arr = response.data;
                    var tbodyHTML = '';
                    
                    if (arr.length > 0) {
                        for (var i = 0; i < arr.length; i++){
                            var id = arr[i]._id;
                                //date = datetimeToString(arr[i]._date, true, true),
                                //open = fmtMoney(arr[i]._open),
                                //bid = fmtMoney(arr[i]._bid);
                            
                            var buttons = '';
                            
                            {{#if system.isadmin}}
                                buttons = 
                                        '<span class="dropdown">'
                                      + '    <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown" aria-expanded="false">Actions</button>'
                                      + '    <div class="dropdown-menu dropdown-menu-end" style="">';
                                      //+ '        <a class="dropdown-item" href="javascript:;" onclick="View.openFormPackages(\'' + arr[i]._id + '\', \'edition\');">'
                                      //+ '            Editar'
                                      //+ '        </a>';
                                
                                buttons += 
                                      '        <hr style="padding: 0;margin: 0;">'
                                    + '        <a class="dropdown-item text-danger" href="javascript:;" onclick="fc_pointsDelete(\'' + arr[i]._id + '\');">'
                                    + '            Delete'
                                    + '        </a>'
                                    + '    </div>'
                                    + '</span>';
                            {{else}}
                            {{/if}}
                            
                            /*var variationBonus = arr[i]._bid - arr[i]._open,
                                variationBonusStr = '';
                            if (variationBonus == 0) {
                                variationBonusStr = 
                                      '<span class="text-yellow d-inline-flex align-items-center lh-1" title="">'
                                    + '    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-minus" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
                                    + '        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                    + '        <line x1="5" y1="12" x2="19" y2="12"></line>'
                                    + '    </svg>'
                                    + '    &nbsp;' + parseFloat(variationBonus).toFixed(2)
                                    + '</span>';
                            } else if (variationBonus > 0) {
                                variationBonusStr = 
                                      '<span class="text-green d-inline-flex align-items-center lh-1" title="">'
                                    + '    <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
                                    + '        <path stroke="none" d="M0 0h24v24H0z" fill="none" />'
                                    + '        <polyline points="3 17 9 11 13 15 21 7" />'
                                    + '        <polyline points="14 7 21 7 21 14" />'
                                    + '    </svg>'
                                    + '    &nbsp;' + parseFloat(variationBonus).toFixed(2)
                                    + '</span>';
                            } else {
                                variationBonusStr = 
                                      '<span class="text-red d-inline-flex align-items-center lh-1" title="">'
                                    + '    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trending-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
                                    + '        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                    + '        <polyline points="3 7 9 13 13 9 21 17"></polyline>'
                                    + '        <polyline points="21 10 21 17 14 17"></polyline>'
                                    + '    </svg>'
                                    + '    &nbsp;' + parseFloat(variationBonus).toFixed(2)
                                    + '</span>';
                            }*/
                            
                            var typeStr = '',
                                sideStr = '';
                            if (arr[i]._type == 'binary') {
                                typeStr = '<span class="badge bg-green">Binary</span>';
                                if (arr[i]._binary_side == 'left') {
                                    sideStr = 
                                          '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-ramp-left-3" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" style="color: #c11b1b;">'
                                        + '   <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                        + '   <path d="M18 3v6"></path>'
                                        + '   <path d="M8 16l-4 -4l4 -4"></path>'
                                        + '   <path d="M18 21v-6a3 3 0 0 0 -3 -3h-11"></path>'
                                        + '</svg>';
                                } else if (arr[i]._binary_side == 'right') {
                                    sideStr = 
                                          '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-ramp-right-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" style="color: #1b28c1;">'
                                        + '   <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                        + '   <path d="M6 3v8.707"></path>'
                                        + '   <path d="M16 14l4 -4l-4 -4"></path>'
                                        + '   <path d="M6 21c0 -6.075 4.925 -11 11 -11h3"></path>'
                                        + '</svg>';
                                }
                            } else {
                                typeStr = '<span class="badge bg-yellow">Unilevel</span>';
                            }
                            
                            var _level = '';
                            if (arr[i]._level > 0) {
                                _level = arr[i]._level;
                            }
                            
                            tbodyHTML += 
                                  '<tr>'
                                + '    <td data-label="Name">'
                                + '        <div class="d-flex py-1 align-items-center">'
                                //+ '            <span class="avatar me-2" style="background-image: url(/assets/img/icons/file-types/png/' + thumbIcon + '.png);background-color: unset;"></span>'
                                + '            <div class="flex-fill">'
                                + '                <div class="font-weight-medium">' + arr[i]._accounts__name + '<br />' + arr[i]._accounts__username + '</div>'
                                //+ '                <div class="text-muted"></div>'
                                + '            </div>'
                                + '        </div>'
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Type">'
                                + '        ' + typeStr
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Origin">'
                                + '        ' + arr[i]._origin__accounts__name + '<br />' + arr[i]._origin__accounts__username
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Type">'
                                + '        ' + sideStr
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Level">'
                                +          _level
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Value">'
                                + '        ' + parseFloat(arr[i]._value)  //.toFixed(2)
                                + '    </td>'
                                + '    <td class="text-muted text-center" data-label="Date">'
                                + '        ' + datetimeToString(arr[i]._date)
                                + '    </td>'
                                + '    <td>'
                                + '        <div class="btn-list flex-nowrap">'
                                //+ '             <button type="button" class="btn btn-primary" onclick="View.openFormPackages(\'' + arr[i]._id + '\', \'edition\');">'
                                //+ '                 <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-pencil" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
                                //+ '                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                //+ '                    <path d="M4 20h4l10.5 -10.5a1.5 1.5 0 0 0 -4 -4l-10.5 10.5v4"></path>'
                                //+ '                    <line x1="13.5" y1="6.5" x2="17.5" y2="10.5"></line>'
                                //+ '                 </svg>'
                                //+ '                 Editar'
                                //+ '             </button>'
                                //+ '             <button type="button" class="btn btn-danger" onclick="fc_pointsDelete(\'' + arr[i]._id + '\');">'
                                //+ '                 <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-pencil" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
                                //+ '                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
                                //+ '                    <path d="M4 20h4l10.5 -10.5a1.5 1.5 0 0 0 -4 -4l-10.5 10.5v4"></path>'
                                //+ '                    <line x1="13.5" y1="6.5" x2="17.5" y2="10.5"></line>'
                                //+ '                 </svg>'
                                //+ '                 Excluir'
                                //+ '             </button>'
                                +               buttons
                                + '        </div>'
                                + '    </td>'
                                + '</tr>';
                        }
                        
                        
                        document.querySelector(".page-body").innerHTML = 
                              ' <div class="container-xl">'
                            + '     <div class="row row-cards">'
                            + '         <div class="col-12">'
                            + '             <div class="card">'
                            + '                 <div class="table-responsive">'
                            + '                     <table class="table table-vcenter table-mobile-md card-table">'
                            + '                         <thead>'
                            + '                             <tr>'
                            + '                                 <th>Nome</th>'
                            + '                                 <th class="text-center">Type</th>'
                            + '                                 <th class="text-center">Origin</th>'
                            + '                                 <th class="text-center">Side</th>'
                            + '                                 <th class="text-center">Level</th>'
                            + '                                 <th class="text-center">Value</th>'
                            + '                                 <th class="text-center">Date</th>'
                            + '                                 <th class="w-1"></th>'
                            + '                             </tr>'
                            + '                         </thead>'
                            + '                         <tbody>'
                            +                               tbodyHTML                                
                            + '                         </tbody>'
                            + '                     </table>'
                            + '                 </div>'
                            + '             </div>'
                            + '         </div>'
                            + '     </div>'
                            + ' </div>';
                    } else {
                        page__points__loadClear();
                    }
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                var jsonResponse = JSON.parse(XMLHttpRequest.responseText);
                
                page__points__loadClear();
            }
        });
    }
    
    function page__points__loadClear() {
        document.querySelector(".page-body").innerHTML = 
              '<div class="container-xl d-flex flex-column justify-content-center">'
            + '    <div class="empty">'
            + '        <div class="empty-img"><img src="https://cdn.brauntech.com.br/ajax/libs/tabler/1.0.0-beta9/demo/static/illustrations/undraw_printing_invoices_5r4r.svg" height="128" alt="" /></div>'
            + '        <p class="empty-title">No results found</p>'
            + '        <p class="empty-subtitle text-muted">'
            + '            Try changing your search or filter to find what you\'re looking for.'
            + '        </p>'
            + '    </div>'
            + '</div>';
    }
    
    function fc_pointsDelete(_id) {
        alertOpen({
                title: "Confirm",
                text: "Delete points?<br /><b>Warning:</b> The points will be permanently deleted!",
                type: "danger",
                confirmButtonText: "Yes",
                cancelButtonText: "No"
            },
            function(){
                //$('.btn_register_tranfer').attr('disabled','disabled').html("Aguarde...")
				$.ajax({
                    type: 'DELETE',
                    url: CFG__API_URL + CFG__API_VERSION + "/points/"+_id,
                    beforeSend: function (xhr){ 
                        xhr.setRequestHeader('Authorization', cookieGet('__utmo'));
                    },
                    data: {},
                    success: function(response) {
                        if (response.success === true) {
                            fc_pointsGetAll("*");
                        } else {
                            showError(response.message);
                        }
                    }
                });
            }
        );
    }
    
    fc_pointsGetAll("*");
</script>