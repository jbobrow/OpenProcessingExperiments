
void setup (){
 size(400,600);
background (255);
noLoop(); 

 }

void draw(){ 
fill(0);
int fila = height/3;
for (int i=0; i<height;i+=fila){
  for (int j=0;j<width; j++){
    point (j,i);
    line(width/2,0,width/2,600);
// hasta aqui va la cudricula, aqui empezaré a ubicar y a meter la UBT y (f(UBT))
//mi UBT es el cuadrado

}
}
int  diagonal=100;
 int a= 200/diagonal;
 int b= 200;
 for (int m=0; m<180; m+=a){
    for(int n=0; n<180; n+=b){
       for(int x=1; x<10; x++){
      stroke(random(255,258),random(255), random(155));
       noFill();
     

     rect(210, 10,m,m);
    rect(210, 210,m/x,m/x);
    rect(210,410, random(m/x),(m/x));   
    rect(10,410,(m/x),random (m/x));
    rect(10,210,random (m/x),random(m/x));
    rect(10,10,random(m/x),random (m/x));
    }
 }
}
}


                
                                
