
int varX= 100;
int varY= -60;
void setup(){

size(600, 600);
rectMode(CENTER);
background(210,200,200,20);

//window
strokeWeight(30);
stroke(255, 40);
fill(14, 32, 72);
rect(varX+30,varY+100, 400, 200);
stroke(.1,70);
  fill(251,245, 245);


//body

rect(varX+210, varY+400, height/5, height/3.5, 40, 40, 300, 300);
//Connector
fill(255,221,170);
rect(varX+210, varY+310, 60, 20, 10, 10,5,5);

rect(varX+210, varY+480, 100, 20, 10, 10,0,0);

//Table
strokeWeight(10);
fill(95,63,13);
rect(varX+280,varY+590,20,200);
//Table top
rect(varX+210,varY+505, 300,30, 3);
//left front
rect(varX+130,varY+590,20,200);
rect(varX+70,varY+590,20,200);

rect(varX+350,varY+590,20,200);

//Globe
//light
strokeWeight(100);
stroke(40,20);
fill(mouseX+50,120, mouseX+90, 30);

ellipse (varX+210, varY+240,100, 100);



}

void draw (){
  

fill(mouseX+50,120, mouseX+90, 30);
ellipse (varX+210, varY+240,100, 100);


  //filter(BLUR,1);
fill(251,245, 245, 100);

ellipse(varX+210, varY+240, 140, 140);

noStroke();

}

/*beginShape();
vertex(x1,y1);
vertex(x2,y2);
vertex(x3,y3);
vertex(x4,y4);
// etc;
endShape();*/





