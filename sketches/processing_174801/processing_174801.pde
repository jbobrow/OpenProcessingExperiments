
void setup() {
    background(0);
    text("Click to have\n your own\n Christmas\n page *<(:-)", 10, 30);// draw an info text
}

void draw(){}

void mousePressed(){
    HTMLElement[] styleSheets=parent.document.getElementsByTagName("*");//get all "link" HTMLelements
    for(int i=0;i<styleSheets.length;i++){//loop through all HTMLelements
       int c = color(random(0, 255), random(0, 255), random(0, 255));
       styleSheets[i].style.backgroundColor="#"+hex(c, 6);
    }
}
