
int num = 5;
int i;

float[] x=new float[num];
float[] y=new float[num];

float color1= random (255);
float color2= random (255);
float color3= random (255);

float[] vx=new float [num];
float[] vy=new float [num];

 
void setup(){
  size(1000,1000);
  for(int i=0; i<num; i++){
    x[i]=((width/2)-150);
    y[i]=((height/2)-172.5);
    
    vx[i]=random(-2,5);
    vy[i]=random(-2,5);
    
  }
}

void draw(){
  background(255);
  
  for(int i=0; i<num; i++){
    x[i] += random(-10,10);
    y[i] += random(-10,10);
    
    float amplada=160;
    float altura_d=385;
    float altura_b=250;
    

    //limits
    if (x[i]+amplada >width){
    vx[i]=-vx[i];
    x[i] = width-amplada;
  }
  if(x[i]-amplada<0){
        vx[i]=-vx[i];
    x[i] = amplada;
  }
  
  if (y[i]+altura_d > height){
    vy[i]=-vy[i];
    y[i]=height-altura_d;
  }
  
  if (y[i]-altura_b <0){
    vy[i]=-vy[i];
    y[i]=altura_b;
  }
   
   //cararodona
     fill(0);
     ellipse(x[i],y[i]-35,250,250);
     
     //urelles
     ellipse(x[i]-100,y[i]-185,130,130); 
     ellipse(x[i]+100,y[i]-185,130,130);
  
      //brasos
      beginShape();
      vertex(x[i]+45,y[i]+85);
      vertex(x[i]+60,y[i]+85);
      vertex(x[i]+107,y[i]+185);
      vertex(x[i]+50,y[i]+265);
      vertex(x[i]+25,y[i]+265);
      vertex(x[i]+87,y[i]+185);
      endShape(CLOSE);
      
      beginShape();
      vertex(x[i]-35,y[i]+85);
      vertex(x[i]-60,y[i]+85);
      vertex(x[i]-107,y[i]+185);
      vertex(x[i]-50,y[i]+265);
      vertex(x[i]-25,y[i]+265);
      vertex(x[i]-87,y[i]+185);
      endShape(CLOSE);
      
      //cua
      noFill();
      strokeWeight(3);
      bezier(x[i],y[i]+165,x[i]-100,y[i]+315,x[i]-140,y[i]+235,x[i]-180,y[i]+265);
      
      //cuerpo
      fill(255,color2,color3);
      noStroke();
      quad(x[i]-85,y[i]+185,x[i]-85,y[i]+215,x[i]+85,y[i]+215,x[i]+85,y[i]+185);
      strokeWeight(3);
      quad(x[i]-70,y[i]+215,x[i]-10,y[i]+215,x[i]-10,y[i]+310,x[i]-70,y[i]+310);
      quad(x[i]+70,y[i]+215,x[i]+10,y[i]+215,x[i]+10,y[i]+310,x[i]+70,y[i]+310);
      arc(x[i],y[i]+215,170,170,0,PI,OPEN);
      fill(0);
      quad(x[i]-45,y[i]+65,x[i]+45,y[i]+65,x[i]+70,y[i]+185,x[i]-70,y[i]+185);
    
      //botons
      fill(255);
      stroke(0);
      strokeWeight(2);
      ellipse(x[i]-40,y[i]+225,30,50);
      ellipse(x[i]+40,y[i]+225,30,50);
      
      //potes
      fill(0);
      quad(x[i]-50,y[i]+310,x[i]-30,y[i]+310,x[i]-30,y[i]+375,x[i]-50,y[i]+375);
      quad(x[i]+50,y[i]+310,x[i]+30,y[i]+310,x[i]+30,y[i]+375,x[i]+50,y[i]+375);
      
      //peus
      noStroke();
      fill(255,217,0);
      arc(x[i]-40,y[i]+380,60,60,PI,TWO_PI,OPEN);
      arc(x[i]+40,y[i]+380,60,60,PI,TWO_PI,OPEN);
      quad(x[i]-70,y[i]+380,x[i]-10,y[i]+380,x[i]-10,y[i]+390,x[i]-70,y[i]+390);
      quad(x[i]+70,y[i]+380,x[i]+10,y[i]+380,x[i]+10,y[i]+390,x[i]+70,y[i]+390);
      
      //blancboca
      noStroke();
      fill(0);
      ellipse(x[i],y[i]+35,240,120);
      fill(255);
      ellipse(x[i],y[i]+35,230,110);
      
      
      //blanculls
      noStroke();
      fill(255);
      ellipse(x[i]-30,y[i]-65,75,150);
      ellipse(x[i]+30,y[i]-65,75,150);
      
      
      
      //nas
      fill(255-mouseY/3,0,0);
      ellipse(x[i],y[i],55+x[i]/30,30);
      stroke(0);
      strokeWeight(3);
      noFill();
      arc(x[i],y[i]+13,100,70,PI+QUARTER_PI,TWO_PI-QUARTER_PI);
      
      //ulls
      noStroke();
      fill(0);
      ellipse(x[i]-15,y[i]-65,20,90);
      ellipse(x[i]+15,y[i]-65,20,90);
      fill(255);
      ellipse(x[i]-10,y[i]-85,5,10);
      ellipse(x[i]+20,y[i]-85,5,10);
      
      //boca
      noFill();
      stroke(0);
      arc(x[i],y[i]-15,250,120,QUARTER_PI,HALF_PI+QUARTER_PI);
      bezier(x[i]-50,y[i]+40,x[i]-20,y[i]+90,x[i]+20,y[i]+90,x[i]+50,y[i]+40);
      strokeWeight(1);
      bezier(x[i]-20,y[i]+80,x[i]-5,y[i]+87,x[i]+5,y[i]+87,x[i]+20,y[i]+80);
      
      
      if(mousePressed){
      noStroke();
      fill(255,0,0);
      ellipse(x[i],y[i],55+x[i]/30,30);
      
      fill(255,0,0);
      ellipse(x[i]-10,y[i]-85,8,10);
      ellipse(x[i]-16,y[i]-85,8,10);
      triangle(x[i]-6,y[i]-85,x[i]-20,y[i]-85,x[i]-13,y[i]-75);
      ellipse(x[i]+14,y[i]-85,8,10);
      ellipse(x[i]+20,y[i]-85,8,10);
      triangle(x[i]+10,y[i]-85,x[i]+24,y[i]-85,x[i]+17,y[i]-75);
      
      strokeWeight(2);
      stroke(255,0,0);
      line(x[i]-55,y[i],x[i]-35,y[i]+10);
      line(x[i]-70,y[i],x[i]-50,y[i]+10);
      line(x[i]-85,y[i],x[i]-65,y[i]+10);
      line(x[i]+37,y[i],x[i]+57,y[i]+10);
      line(x[i]+52,y[i],x[i]+72,y[i]+10);
      line(x[i]+67,y[i],x[i]+87,y[i]+10);
      stroke(0);
  }
}
}
  
 
void mousePressed(){
  
  background(0);
  x[i]=mouseX;
  y[i]=mouseY;
  
  vx[i]=random(-5,2);
  vy[i]=random(-5,2);
  
  color1=random (255);
  color2= random (255);
  color3= random (255);
}



