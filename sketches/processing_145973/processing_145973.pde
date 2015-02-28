
HTMLElement myPicker;

void setup() {
 size(256,256);
       HTMLElement jscolorPicker = document.createElement('input');//create a new textInputElement
       jscolorPicker.className="color";
       externals.canvas.parentNode.insertBefore(jscolorPicker, externals.canvas);
       externals.canvas.parentNode.style.textAlign="left";
loadExternalScript('http://gwittmann.mrbenson.org/pde/hermit/jscolor/jscolor.js',
 function(){  myPicker = new jscolor.color(jscolorPicker, {});
       myPicker.fromString('99FF33')  // now you can access API via 'myPicker' variable
  });
}


void draw() { 
    String col=(""+myPicker);
    background(hexToR(col),hexToG(col),hexToB(col));
    fill(hexToR(col),hexToG(col),hexToB(col));
    ellipse(mouseX,mouseY,20,20);
    fill(255-hexToR(col),255-hexToG(col),255-hexToB(col));
    text(col,20,200);
}


void loadExternalScript(String url, void callback){
    HTMLElement script = document.createElement("script");  script.type = "text/javascript";
  if (script.readyState){ /*IE*/ script.onreadystatechange = function(){ if (script.readyState == "loaded" || script.readyState == "complete"){ script.onreadystatechange = null; callback(); } };
  } else {  /*Others*/ script.onload = function(){  callback();  };}
    script.src = url;    document.body.children[0].appendChild(script);
}

int hexToR(h) {return parseInt((h).substring(0,2),16)}
int hexToG(h) {return parseInt((h).substring(2,4),16)}
int hexToB(h) {return parseInt((h).substring(4,6),16)}
