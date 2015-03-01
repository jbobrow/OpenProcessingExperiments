
HTMLElement[] styleSheets;
void setup() {
    background(0);
    styleSheets=parent.document.getElementsByTagName("*");//get all "link" HTMLelements
    text("Shake it!", 10, 30);// draw an info text
}
  
void draw(){
float offset = sin(millis()*0.001);
for(int i=0;i<styleSheets.length;i++){//loop through all HTMLelements
        float x = int(styleSheets[i].style.left.replaceAll("[^\\d.]", "")) + offset;
        float y = int(styleSheets[i].style.top.replaceAll("[^\\d.]", "")) + offset;
        styleSheets[i].style.left = "" + x + "px";
        styleSheets[i].style.top = "" + y + "px";
    }
}

