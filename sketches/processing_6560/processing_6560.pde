

 
void setup(){
  size(300,300,P2D);
  smooth(); 

  k = width*height;  
}
int p,k,ll;

void draw(){
  background(255);
  for( int o=0;o<width*height;o++){
    p+=mouseX;
    k-=mouseX;

    //p+=ll; //uncomment to save pics
    // k-=ll; //uncomment to save pics  
    
    if (p>width*height-1){
      p=0; 
    }

    if (p<1){
      k=width*height; 
    }
    int _x= (int)p/width;
    int _x1= (int)k/width;
    int _y = p-(_x*width);
    int _y1 = k-(_x1*width);
    point(_x,_y); 
    point(_y,_x); 
    point(_x1,_y1); 
    point(_y1,_x1); 
  }
  
  
//  ll++;  //uncomment to save pics
//   pic++;
//  save("tile-"+str(pic)+".png"); 
//  if (ll>999){
//   exit();  
//  }
}

// int pic;
//void mousePressed(){
// pic++;
//save("tile-"+str(pic)+".png"); 
//  
//}

