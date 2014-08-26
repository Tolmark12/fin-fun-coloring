this["finfun"] = this["finfun"] || {};
this["finfun"]["box-picker"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, helper, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "<div style=\"background:url(/images/"
    + escapeExpression(((stack1 = (depth0 && depth0.thmb)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ")\" data_full=\""
    + escapeExpression(((stack1 = (depth0 && depth0.full)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" data_thmb=\""
    + escapeExpression(((stack1 = (depth0 && depth0.thmb)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" default=\""
    + escapeExpression(((stack1 = (depth0 && depth0['default'])),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" class=\"option\"></div>";
  return buffer;
  }

  buffer += "<div class=\"box-picker ";
  if (helper = helpers.className) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.className); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\"><div class=\"active-box\"><div class=\"image\"></div></div><div class=\"options\">";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.options), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</div></div>";
  return buffer;
  });
this["finfun"] = this["finfun"] || {};
this["finfun"]["color-picker"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "";
  buffer += "<div style=\"background:"
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\" class=\"swatch\"></div>";
  return buffer;
  }

  buffer += "<div class=\"color-picker\"><div class=\"picked-color\"></div><div class=\"swatches\"><div class=\"swatch-column\">";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.left), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</div><div class=\"swatch-column\">";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.mid), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</div><div class=\"swatch-column\">";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.right), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</div></div></div>";
  return buffer;
  });
this["finfun"] = this["finfun"] || {};
this["finfun"]["svg-filters"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<defs><filter id=\"blur\"><feGaussianBlur stdDeviation=\"4\"></feGaussianBlur></filter></defs>";
  });