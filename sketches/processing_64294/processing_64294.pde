
float[] a = new float[2];
int maxLength = 10;

void setup(){
    
    frameRate(60);
    background(#FFFFFF);
    size(600,400);
    smooth();
    strokeWeight(random(3));
    stroke(0,0,0,128);
      
}

void draw(){

    
    a[0] = {random(width),random(height)};
    a[1] = {random(width),random(height)};
    a[2] = {random(width),random(height)};
    
    for( int q=0; q<a.length; q = q+1 ){
            a[q] = a[q+1];
        }
    
    for( int q=0; q<a.length; q = q+1 ){
            //line(random(width),random(height),random(width),random(height));
            line(0,0,a[q][0],a[q][1]);
        }
    
    

    
   
   //background(#FFFFFF); 
    
   
}
