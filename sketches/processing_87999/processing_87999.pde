
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: 1px dashed #ccc;");

String lastIndex;
int tmpIndex=0, eSize=90;

size (500, 500);
fill (0x500090ff);
noStroke();
background(#ffffff);

if (check) {
        String tmp = localStorage["index"];
        if (tmp != null) {
                lastIndex = tmp;
                tmpIndex = int(lastIndex);
                for (int i=0; i<=tmpIndex; i++) {
                        String[] values = split ( localStorage [str(i)], "-");
                        ellipse ( int(values[0]), int(values[1]), eSize, eSize);
                }   
        } else {
                lastIndex="0";
        }   
}


void mousePressed () {
        ellipse (mouseX,mouseY, eSize, eSize);
        if (check) {
                String newIndex = str (tmpIndex++);
                String pos = mouseX + "-" + mouseY;
                localStorage["index"] = newIndex;
                localStorage[newIndex] = pos;
        }   
}

void keyPressed () {
    background (#ffffff);
    localStorage.removeItem ("index");
    for (int i=0; i<=tmpIndex;i++) {
        localStorage.removeItem(str(i));
    }
}

function check() { 
  try { 
    return 'localStorage' in window && window['localStorage'] !== null; 
  } catch (e) { 
    return false; 
  }   
}
