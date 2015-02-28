
 PFont bootFont;
void setup(){
 size (500,500);
background(230,215,100); 
}

void draw(){
int a=mouseX;
int b=mouseY;
if (a>250&&b>250){
background(255,8,100); 
 bootFont = createFont("Helvetica",60,true);
 textFont(bootFont);
 text("Musen",100,250);
 
fill(255); 
ellipse(mouseX,mouseY,50,50);
}

else{
background(100,115,100);
stroke(222,100,111);
noFill();

rect(23,25,mouseX,mouseY);

}




}


