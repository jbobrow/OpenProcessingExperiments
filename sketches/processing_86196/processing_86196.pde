
void setup(){

size (800,800);

}

void draw(){
  
println("Mouse X: " + mouseX+ " MouseY: " + mouseY);

background(255);

noStroke();

rectMode(CENTER);

//antennas

fill(0);

noStroke();

rect(mouseX+387,mouseY+200,4,60);

rect(mouseX+356,mouseY+172,58,4);

rect(mouseX+413,mouseY+200,4,60);

rect(mouseX+444,mouseY+172,58,4);

fill(mouseX,mouseY,69);

//body and head

ellipse(mouseX+400,mouseY+400,mouseX+200,mouseY+200);

ellipse(mouseX+400,mouseY+250,100,100);

//eyes

fill(139,0,0);

ellipse(mouseX+370,mouseY+240,25,35);

ellipse(mouseX+392,mouseY+240,9,12);

ellipse(mouseX+405,mouseY+240,9,12);

ellipse(mouseX+425,mouseY+240,25,35);

//legs

stroke(255,255,51);

stroke(102,51,0);

strokeWeight(5);

line(mouseX+312,mouseY+354,mouseX+184,mouseY+297);

line(mouseX+184,mouseY+297,mouseX+146,mouseY+460);

line(mouseX+306,mouseY+380,mouseX+203,mouseY+347);

line(mouseX+203,mouseY+347,mouseX+168,mouseY+462);

line(mouseX+302,mouseY+415,mouseX+208,mouseY+381);

line(mouseX+208,mouseY+381,mouseX+179,mouseY+471);

line(mouseX+310,mouseY+443,mouseX+213,mouseY+409);

line(mouseX+213,mouseY+409,mouseX+193,mouseY+478);

//right side

line(mouseX+488,mouseY+354,mouseX+616,mouseY+306);

line(mouseX+616,mouseY+306,mouseX+664,mouseY+460);

line(mouseX+497,mouseY+380,mouseX+597,mouseY+347);

line(mouseX+597,mouseY+347,mouseX+632,mouseY+462);

line(mouseX+498,mouseY+415,mouseX+592,mouseY+381);

line(mouseX+592,mouseY+381,mouseX+618,mouseY+471);

line(mouseX+490,mouseY+443,mouseX+587,mouseY+409);

line(mouseX+587,mouseY+409,mouseX+607,mouseY+478);

//eye points

stroke(0);

point(mouseX+369,mouseY+237);

point(mouseX+369,mouseY+245);

point(mouseX+423,mouseY+246);

point(mouseX+423,mouseY+238);

point(mouseX+392,mouseY+240);

point(mouseX+405,mouseY+240);

//mouth

noStroke();

fill(85,83,44);

ellipse(mouseX+389,mouseY+273,22,40);

ellipse(mouseX+409,mouseY+273,22,40);

}












