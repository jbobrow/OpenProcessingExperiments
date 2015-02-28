
int num=100;
float[]X=new float[num];
float[]Y=new float[num];
float[]es=new float[num];
float amount;

void setup(){
  size(600,400);
  background(0);
}

void draw(){
    amount=2;
   for(int i=0; i<num; i++){
     X[i]+=random(-amount,amount);
     X[i]=constrain(X[i],0,width);
     Y[i]+=random(-amount,amount);
     Y[i]=constrain(Y[i],0,height);
     es[i]+=random(-amount,amount);
     es[i]=constrain(es[i],2,20);
     noStroke();
     fill(255,10);
     ellipse(X[i],Y[i],es[i],es[i]);
   }
   if(mouseButton==RIGHT){
     background(0); 
   }  
}

void mousePressed(){
  for(int i=0; i<num; i++){
    X[i]=mouseX;
    Y[i]=mouseY;
  }
} 
      

                
                                                
