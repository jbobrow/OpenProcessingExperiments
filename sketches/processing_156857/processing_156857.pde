




void setup(){
  size(500,500);
  background(0);

}


void draw(){
  background(0);
  for(float i=0; i < width; i += 20){
    
  
    float sin;
    float cos;
    sin = sin((frameCount+i)*0.1);  //i++ = frameCount
    cos = cos((frameCount+i)*0.5);
    //float c;
    //c = color(10,100,100);  doesn't work...
    
    fill(200,100,300);
    rect(i, cos, 10, 10);
    rect(i, height/2 + (cos*30), 10, 10);
    
    ellipse(i,height/2+(sin*120), 40,3);
   // println(sin);
    println(cos);
    }
    for(float j=0; j < width; j += 20){
          float cos;
          cos = cos((frameCount+j)*2)*2;
    rect(cos, j, 10, 10);
    
    }
  }


