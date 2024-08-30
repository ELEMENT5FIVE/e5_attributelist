{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{*if isset($st_att_list_groups)}
<div class="st_attr_list_container {if $st_att_list_center} st_attr_list_text_center{/if}">
{foreach from=$st_att_list_groups key=id_attribute_group item=group}
	{if $group.attributes|@count && ($st_att_list_show==1 || array_sum($group.attributes_quantity)>0)}
        <div class="st_attr_list_item">
            <strong>{$group.name} :</strong>
    		{if ($group.group_type == 'color' && $st_att_list_color)}
                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                {if $st_att_list_show==1 || $group.attributes_quantity[$id_attribute]>0}
                <span class="st_attr_list_swatch" title="{$group_attribute}" style="{if $group.colors[$id_attribute]['type']}background-image: url('{$group.colors[$id_attribute]['value']}');{else}background-color:{$group.colors[$id_attribute]['value']};{/if}"></span>
                {/if}
                {/foreach}
    		{else}
                {foreach from=$group.attributes key=id_attribute item=group_attribute}
                {if $st_att_list_show==1 || $group.attributes_quantity[$id_attribute]>0}
                <span class="st_attr_list_text">{$group_attribute}</span>
                {/if}
                {/foreach}
    		{/if}
        </div>
	{/if}
{/foreach}
</div>
{/if*}
{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{*if isset($st_att_list_groups)}
      <div class="st_attr_list_container {if $st_att_list_center} st_attr_list_text_center{/if}">
            {foreach from=$st_att_list_groups key=id_attribute_group item=group}
                  {if $group.attributes|@count && ($st_att_list_show==1 || array_sum($group.attributes_quantity)>0)}
                        <div class="st_attr_list_item">
                              <strong>{$group.name} :</strong>
                              {if ($group.group_type == 'color' && $st_att_list_color)}
                                    {foreach from=$group.attributes key=id_attribute item=group_attribute}
                                          {if $st_att_list_show==1 || $group.attributes_quantity[$id_attribute]>0}
                                                <span class="st_attr_list_swatch" title="{$group_attribute}"
                                                      style="{if $group.colors[$id_attribute]['type']}background-image: url('{$group.colors[$id_attribute]['value']}');{else}background-color:{$group.colors[$id_attribute]['value']};{/if}"></span>
                                          {/if}
                                    {/foreach}
                              {/if}
                        </div>
                  {/if}
            {/foreach}
      </div>
{/if*}
{if isset($st_att_list_groups)  && $st_att_list_groups != null}
      {assign var="all_colors" value=[]}
      {assign var="color_type" value=[]}
      {foreach from=$st_att_list_groups key=id_attribute_group item=group}
            {if $group.attributes|@count && ($st_att_list_show==1 || array_sum($group.attributes_quantity)>0)}
                  {if ($group.group_type == 'color' && $st_att_list_color)}
                        {assign var="max_colors" value=3}
                        {foreach from=$group.attributes key=id_attribute item=group_attribute name=colorLoop}
                              {if $st_att_list_show==1 || $group.attributes_quantity[$id_attribute]>0}
                                    {if $group.colors[$id_attribute]['type']}
                                          {append var="all_colors" value=$group.colors[$id_attribute]['value']}
                                          {append var="color_type" value="image"}
                                    {else}
                                          {append var="all_colors" value=$group.colors[$id_attribute]['value']}
                                          {append var="color_type" value="color"}
                                    {/if}
                              {/if}
                        {/foreach}
                  {/if}
            {/if}
      {/foreach}
      <div class="product-colors-grid">
            <div class="product-colors-grid-container">
                  {assign var="remaining_colors" value=$all_colors|@count-$max_colors}
                  {foreach from=$all_colors key=id_color item=color name=colorsLoop}
                        {if $smarty.foreach.colorsLoop.index < $max_colors}
                              {if $color_type[$id_color] == 'image'}
                                    <div class="product-colors-grid-item">
                                          <div class="product-colors-circle"
                                                style="background-image: url('{$color}');">
                                          </div>
                                    </div>
                              {elseif $color_type[$id_color] == 'color'}
                                    <div class="product-colors-grid-item">
                                          <div class="product-colors-circle"
                                                style="background-color:{$color};">
                                          </div>
                                    </div>
                              {/if}
                        {/if}
                  {/foreach}
                  {if $remaining_colors > 0}
                        <div class="product-colors-grid-item">
                              <div class="product-colors-last">+{$remaining_colors}</div>
                        </div>
                  {/if}
            </div>
      </div>
{/if}