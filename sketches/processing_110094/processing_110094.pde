
float a=-200;
float c=100;
float x=100;
float d=99;
float e=101;
float e1=10;
float e2=5;

void setup() {
  size(500,500);
}

void draw() {
  
  background(200,150,150,150); //background
  stroke(0);
  strokeWeight(1);
  line(0,395,width,395);
  
  fill(255);   // the egg
  ellipse(c,a,50,70);
  a=constrain(a,-200,365);
  
  
  if(a==365){ //the egg breaks
    fill(0);
    strokeWeight(2); 
    line(100,400,90,390);
    line(90,390,110,370);
    line(110,370,88,357);
    line(88,357,113,345);
    line(113,345,94,332);
    line(mouseX-4,mouseY+30,mouseX-6,mouseY+23); 
    //line(mouseX-1,mouseY+28,mouseX-2,mouseY+18); 
   
    e1= 15;
    e2= 8;
    
    fill(#000000);
    text("Oh no! You ruined it :(", 341,215);
    textAlign(CENTER);
     
  }
   else if(a==mouseY-1 && (x==mouseX || d==mouseX || e==mouseX)){ // will fly catch the falling egg?
  a=a;  //it sense the weight...
  
  fill(#000000);
    text("Great work pal, hang on there!", 341,215);
    textAlign(CENTER);
  
  }
 
  else if (a!=mouseY-1 || x!=mouseX){ // the egg falls...
  a=a+1;  // don't understand why works on || and not on &&?
  
  fill(#000000);
    text("OMG! my unborn brother is falling from the sky!!", 300,215);
    textAlign(CENTER);
    
  }
  

//The chicken:

 strokeWeight(1);
 noStroke();
 fill(#ffce21);
 triangle(309,289,292,293,311,303);

//chicken body//
 noStroke();
 fill(255,255,255);
 
 ellipse(342,296,70,60);
 ellipse(366,337,100,80);
 
 //chicken leg//
 stroke(#ffce21);
 strokeWeight(5);
 line(352,378,352,390);
 
 
 stroke(#ffce21);
 strokeWeight(5);
 line(370,378,370,390);


//chicken eye//
 stroke(#898989);
 strokeWeight(1);
 ellipse(324,287,e1,e1);
 
//chicken eyeball//
  noStroke();
  fill(#000000);
  ellipse(324,287,e2,e2);

 
 
 //chicken top//
 noStroke();
 fill(#ff4a4a);
 beginShape();
  curveVertex(322,271);
  curveVertex(317,265);
  curveVertex(317,259);
  curveVertex(323,258);
  curveVertex(328,258);
  curveVertex(330,262);
  curveVertex(330,267);
  curveVertex(332,262);
  curveVertex(335,256);
  curveVertex(338,255);
  curveVertex(342,255);
  curveVertex(346,255);
  curveVertex(347,258);
  curveVertex(348,261);
  curveVertex(348,265);
  curveVertex(348,265);
  curveVertex(350,261);
  curveVertex(353,256);
  curveVertex(356,255);
  curveVertex(361,255);
  curveVertex(365,256);
  curveVertex(366,259);
  curveVertex(366,263);
  curveVertex(366,265);
  curveVertex(366,271);
  curveVertex(365,273);
  curveVertex(365,273);
  curveVertex(358,269);
  curveVertex(351,267);
  curveVertex(334,267);
  curveVertex(318,273);

  curveVertex(329,268);
  curveVertex(318,274);
  curveVertex(318,266);
 endShape(CLOSE);

 // the Fly
  stroke(0);
  fill(255);  // the fly
  ellipse(mouseX+4,mouseY+33,5,10); //ala
  ellipse(mouseX+6,mouseY+33,5,10); //ala
  fill(0);
  strokeWeight(6);
  line(mouseX,mouseY+35,mouseX+5,mouseY+35);
  strokeWeight(1);
  fill(255);
  ellipse(mouseX,mouseY+35,2,2);

}
  

void keyPressed(){
 a=a-10; 
} 

void mousePressed (){
 println("x: "+mouseX); 
 
}


