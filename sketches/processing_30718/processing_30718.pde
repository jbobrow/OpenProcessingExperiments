
	

float llb;

void setup() {
  
  size(800,800);
  smooth();
  background(255,255,255);
  llb=5;
}

void draw() {
 
// fill(random(100,255),random(200,255),random(200,255), 2); 
 //rect(0,0, 1000,1000); 
 // background(255,255,255);


 
// translate(400,400);
 
//fill(25,0,0,0);
  //stroke(0,0,50);
   //rotate( mouseX/60.0);
   
  //ellipse(0,0,200,300 );
 
   //noFill();
  stroke(mouseY,0,0,50);
  rotate( mouseX/300.0);
  ellipse(mouseX,mouseY,mouseX*tan(llb/300),300*tan(llb/500)  );
  llb=llb + 6;
  //ellipse(mouseX,mouseY,100*sin(llb/200),100*sin(llb/200)  );
  llb=llb + 8;
  stroke(11,113,46);
 //ellipse(mouseX,mouseY,200*cos(llb/50),200*cos(llb/50)  );
  llb=llb + 4;
  stroke(mouseX,11,0,0);
  
    rotate(mouseX/30.2);
 translate(20,20);
 //ellipse(100,100,20,10);
 rotate(millis()/500.0);
 

noFill();
  stroke(0,0,0);
  //ellipse(200,200,300*cos(llb/300),300*cos(llb/5)  );
  llb=llb + 6;
  //ellipse(600,600,100*tan(llb/100),100*tan(llb/2) );
  llb=llb + 4;
//line(400 + llb/2,50, 50*cos(llb/12),100);
llb=llb -2;
 
  }
  
  


void mouseClicked() {
  background(255);
 // save("imagem.png");
 // endRecord();
  //exit();
}


