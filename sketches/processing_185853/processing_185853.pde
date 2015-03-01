
HTMLElement[] styleSheets;
void setup() {
    background(0);
    styleSheets=parent.document.getElementsByTagName("*");//get all "link" HTMLelements
    text("Shake it!", 10, 30);// draw an info text
}
 
void draw(){
for(int i=0;i<styleSheets.length;i++){//loop through all HTMLelements
        float x = int(styleSheets[i].style.left.replaceAll("[^\\d.]", "")) + random(-5, 5);
        float y = int(styleSheets[i].style.top.replaceAll("[^\\d.]", "")) + random(-5, 5);
        styleSheets[i].style.left = "" + x + "px";
        styleSheets[i].style.top = "" + y + "px";
    }
}
 
