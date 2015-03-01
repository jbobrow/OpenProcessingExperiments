
int i; //x coordinate of arc ellipse
int j; //y coordinate of arc ellipse
int w=48;//width of arc ellipse
int h=48;//height of arc ellipse
PImage tassel;


void setup() {
  size(600,800);
    fill(158,77,205);
  rect(100,100,400,600,2);
  tassel= loadImage("tassel.png");

  
     // (pointx, pointy, controlx, controly,controlx2, controly2, pointx2, pointy2)
//  bezier((width/3)*2, height/4),
}

void draw(){
  image (tassel, 20, 20, 100,100);
 
  image (tassel, 410, 20, 100, 100);
  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 100, 140 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 150, 210 );
  
  
//    bezier(width/4, height/2, , height/4, (width/4)*2, height/2, (width/3)*2, height/4); 
      
      bezier(width/4, sinMappedY, width/3, height/4, (width/4)*2, height/2, (width/3)*2, height/4); 


  fill(0);

 for(int i = 134; i<442; i= i +(w-1)){
       for(int j= 149; j<159; j= j+48){
     arc(i, j, w, h, radians(180), radians(360));
       }
     }
     
  for(int i = 134; i<140; i= i + w){
       for(int j= 149; j<638; j= j+(h-1)){
     arc(i, j, w, h, radians(90), radians(270));
       }
     }
     
 //bottom
      for(int i = 134; i<442; i= i +(w-1)){
       for(int j= 590; j<638; j= j+48){
     arc(i, j, w, h, radians(180), radians(360));
       }
     }
     
//     for(int i = 480; i<500; i= i + w){
//       for(int j= 590; j>600; j= j+48){
//     arc(i, j, w, h, radians(270), radians(90));
//       }
//     }
     
     
     
     
     
  
}


