

void setup(){
            size(400,400);
}
void draw(){   if(mouseX>=200 && mouseX<=400 && mouseY<=200){
 background(random(255),random(255),random(255));
}   //Our code from before(the top right side filled with mouse)//
else if(mouseX<=200 && mouseX<=400 && mouseY>=200){
 background(255,0,0);
 } //the bottom left side filled with mouse//
 else if(mouseX<=200 && mouseX<=400 && mouseY<=200){
 background(0,255,0); 
} //the top left side filled with mouse//
else if(mouseX>=200 && mouseX<=400 && mouseY>=200){
 background(0,0,255);
} //the bottom right side filled with mouse//

drawLines(0,0); //calls function drawLines//
 // line(width,0,0,height);
//  line(0,0,width,height);
//  line(0,height/2,width,height/2);
// line(width/2,0,width/2,height);

for( int x = 0; x < width ; x+=10){    /*creates many rectangles starting at x=0 and y=20 and ends at x=400 and the fill color is random other than black/white/or gray is random*/
   fill(random(255),random(255),random(255));
   rect(x,20,30,30);
   rect(x,360,30,30);

    }


}
//define function to draw all lines//
void drawLines(int x, int y)  {           
    line(x,y,width,height);
    line(width,y,x,height);
    line(x,height/2,width,height/2);
    line(width/2,y,width/2,height);
   }












