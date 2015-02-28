
public class TiPoint{

float x, y;

public TiPoint(float x, float y){
  if ((x>1) || (x<0) || (y>1) || (y<0) ){
    x = 0.5f;
    y = 0.5f;
}else{
  this.x = x;
  this.y = y;
}
}

public boolean isLefterThan(TiPoint t){
  return (this.x > t.x);
}

public void dessiner(){
  ellipse((int)(x*width), (int)(y*height), 7, 7);
}

public boolean collision(int x, int y){
   if (abs(x-this.x*width)<10 && abs(y-this.y*height)< 10){
   return true;
   }
   return false;
}

public void move(float x, float y){
 
  if ( (x>1) || (x<0) ){
    x = 0.5f;
 }
 if ( (y>1) || (y<0) ){ 
    y = 0.5f;
}
  
this.x = x;
this.y = y;

}

}

