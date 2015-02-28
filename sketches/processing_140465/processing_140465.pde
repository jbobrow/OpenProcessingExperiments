
var nodes;
 
int CURSOR = 10;
 
void setup() {
  size(300,800);
}
 
void draw() {
  CURSOR = 10;
  doc = parent.document.body;
  background(0);
  showNodes(doc, 0);
  fill(255);
}
 
//recursive function that gets all nodes :)
function showNodes(var n, int level) {
  var id = null;
  int margin = int(random(-10,10));                        //lets choose some margin
  if(n != "[object Text]" && n != "[object Comment]") {    //text and comment have no id nor width
    id = n.getAttribute("id");
    n.style.borderWidth = margin+"px";                     //set net style :D
  }
  String txt = "";                                         //txt is an info about current element
  for(int i=0; i<level; i++) {
    txt += "Ã¢ï¿½ï¿½";
  }
  txt += n+" : "+id;
  gprintln(txt);
   
  var array = n.childNodes;
  for(int i=0; i<array.length; i++) {                       //we will take all child nodes of the element
    var e = array[i];
    showNodes(e, level+1);                                  //and do all the stuff with them!
  }
}
 
function gprintln(String txt) {
  text(txt, 50, CURSOR);
  CURSOR += 10;
}

