
//50 bouncing balls
//differnce kind of bounce
//basic particle system
int ballno=100;

//declaring variable
float circlex[]= new float[ballno];
float circley[]= new float[ballno];
float vely[] = new float[ballno];
float velx[] = new float[ballno];
float g = 0;

void setup(){
  smooth();
  frameRate(60);
  size(1000,1000);
  //initialize the array
  for(int i=0;i<ballno;i++){
    circlex[i]=0;
    //random(10,width-10);
    circley[i]=0;
    //random(10,height-10);
    vely[i]=random(3);
    velx[i]=random(3);
      background(255);
  }
     
}

void draw(){

  //fill(0,random(150,255),random(150,255),random(100,255));

    //fill(255);
    //fill(r,g,0);
    //rect(0,0,width,height);
    //noStroke();
    //fill(255-r,100,255-g,random(100,110));
    //noFill();
    fill(255,random(100,230));
    strokeWeight(1);

    for (int i=0;i<ballno;i++){
    circlex[i]+=velx[i];
    circley[i]+=vely[i];
    float r = map(circlex[i],0,width,0,255);
    float g = map(circley[i],0,height,0,255);  
    stroke(r,255-r,g);
  //triangle(0,circley[i],50+circlex[i]%15,0,width/2,height/2);
  ellipse(circlex[i],circley[i],random(18,30),random(18,30));
  //rect(circlex[i],circley[i],50+circlex[i]%15,random(380,400));
//50+circlex[i]/5
  if((circlex[i]<0)||(circlex[i]>width)){
    velx[i]=velx[i]*-1;
  }
  if((circley[i]<0)||(circley[i]>height)){
    vely[i]=vely[i]*-1;
  }
 
}
   //same as vel=vel
   //inserting picture
}

