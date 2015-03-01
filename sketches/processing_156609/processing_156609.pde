
    int t=0;
    int q=0;
void setup(){
  size(500,500);
  frameRate(10000);
  background(0);
}

void draw(){
    int u=255;

    noStroke();
    fill(t,0,0);
    do{
       ellipse(25+t,25+q,50+t,50+t);
        t++;   
     }while(t<10);
     
     do{
       ellipse(width-t,25+q,50+t,50+t);
        t++;   
     }while(t<10);
     

    
//  for(int i=0;i<10;i++){
////    println("IN"+i);
////    println("U="+u);
//        for(int j=0;j<10;j++){
//          if(mouseX>50*i && mouseX<50*(i+1) &&mouseY>50*j && mouseY<50*(j+1))
//          {
//            fill(0,u,u);
//          }else{
//            fill(u,0,0);
//          }
//            ellipse(25+i*50,25+j*50,50,50);
//            u-=1;  
//        }
//   }
   if(25+t==width/2 )
   {
    q+=50;
    t=0;
   }
  
}




