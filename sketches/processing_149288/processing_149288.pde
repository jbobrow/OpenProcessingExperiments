
img setup (){
pantalla==1;}

int a;
int b;
int posx, posy;
 
void setup() {
 
size(710,390);
posx=0;
posy=height/2;
}
void draw() {
background(2*dist (mouseX,mouseY,355,260)+40,2*dist (mouseX,mouseY,355,260)+40,2*dist (mouseX,mouseY,355,260)+40);

//(mouseY*1.1,mouseY*1.1,mouseY*1.1);
stroke (0,0,0,90);
fill (0,0,0,0);
strokeWeight (1);
 
ellipse(mouseX,mouseY,3.5*(dist (mouseX,mouseY,width/2,260)+1),3.5*(dist (mouseX,mouseY,width/2,260+1)));
stroke (0,0,0,0);
fill (15,255,15);
ellipse(width/2,width/3,63,63);

String s = "Start";
fill(10);
text(s, width/2-15,2*height/3-27, width/2+20,height/2+20);  // Text wraps within text box
String s = "Alejandro Plasencia";
fill(10);
text(s, 10, 10, 150, 80);  // Text wraps within text box
}




