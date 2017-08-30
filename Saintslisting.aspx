﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Saintslisting.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Saintslisting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet"/>
    <link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    <link href="Content/calendar-blue.css" rel="stylesheet"/>
    <link href="Content/prayers.css" rel="stylesheet"/>
    <script src ="Scripts/isotope.js"></script>

    <div class="box-body" style="background-image: url(Images/Background.jpg)">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="row">

                    <br/><br/>

                    <h1 class="moods">Saints Listing</h1>

                    <br/><br/>

                </div>
                    <div class="row">
                    <div class="col-md-3">
                        <ul class="btn-categories" runat="server" id="ButtonContainer">
                            <li><button class="button is-checked" data-filter="*">show all</button></li>
                        </ul>
                    </div>
                        <div class="col-md-9">
                <div id="container">
                    <div class="row">
                        <div class="col-md-3 col-md-offset-8">
                            <input type="text" class="fuzzy-search form-control" placeholder="Search . . ."/>
                        </div>
                    </div>

                     <div class="content" style="overflow-y: hidden;">
                        <div id="tablex">

                            <br/><br/><br/>

                            <div class="list">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>

        var $grid;
        var prayers;

        (new http).post('Saintslisting.aspx/GetSaints', {}).then(function(response) {
            prayers = new Map();
            var items = [];

            $.each(response.d,
               function (key, prayer) {
                   prayers.set(prayer.Id, prayer);

                   items.push({
                       prayer: prayer.Name,
                       aLink: 'Saintlisting.aspx?id=' + prayer.Id,
                       category: prayer.ClassName,
                       prayers: 'col-md-3 prayers',
                       criteria: prayer.ClassName
                   });
               });

            var options = {
                valueNames: [
                    'prayer',
                    {
                        name: 'aLink',
                        attr: 'href'
                    },
                    {
                        data: ['category']
                    },
                    {
                        data: ['criteria']
                    }
                ],
                item: '<div class="col-md-3 prayers" data-criteria="" data-category=""><a class="aLink prayer" href=""></a></div>'
            };
            var list = new List('container', options, items);

            $grid = $('.list').isotope({
                itemSelector: '.prayers',
                layoutMode: 'fitRows'
            });
        }).run();

        // external js: isotope.pkgd.js

        // init Isotope
        // bind filter button click
        $('.btn-categories').on('click', 'button', function (e) {
            e.preventDefault();

            var filterValue = $(this).attr('data-filter');
            // use filterFn if matches value
            filterValue = filterValue;
            $grid.isotope({ filter: filterValue });

            // If the filter is all *
            if (filterValue == '*')
            {
                // show search box
                $(".fuzzy-search").css('display', 'block');
            } else {
                // hide search box
                $(".fuzzy-search").css('display', 'none');
            }
        });

        
        // change is-checked class on buttons
        $('.btn-categories').each(function (i, buttonGroup) {
            var $buttonGroup = $(buttonGroup);
            $buttonGroup.on('click', 'button', function () {
                $buttonGroup.find('.is-checked').removeClass('is-checked');
                $(this).addClass('is-checked');
            });
        });
    </script>
</asp:Content>