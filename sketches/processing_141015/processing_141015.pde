
int a=3;

int mom[];
int dad[];
int sis[];
int bro[];


void setup(){
  size(700,700);
  mom=new int[a];
  dad=new int[a];
  sis=new int[a];
  bro=new int[a];
  }
 
  void draw(){
   background(225);
    for (int i=1; i<a; i++){
      mom[i-1]=mom[i];
      dad[i-1]=dad[i];
      sis[i]=sis[i];
      bro[i]=bro[i-1];
    }
    
  mom[a-1] = mouseX;
  dad[a-1] = mouseY;
  sis[a-1] = mouseX;
  bro[a-1] = mouseY;
  
  for(int i = 1; i< a; i++){
   stroke(255,255,255,20);
    fill(255,255,255,150);
    ellipse(bro[i],sis[i],20,20);
    ellipse(mom[i],dad[i],20,20);
    ellipse(dad[i],dad[i],20,20);
    ellipse(mom[i],mom[i],20,20);
    
    
    fill(255,193,219,80);
    quad(bro[i],(sis[i]),mom[i],(dad[i]),(bro[i]),dad[i],cos(bro[i]),sis[i]);
    quad(mom[i],(mom[i]),mom[i],(dad[i]),(dad[i]),dad[i],cos(mom[i]),dad[i]);
    
    fill(255,242,193,80);
    quad(dad[i],mom[i],dad[i],500,mom[i],dad[i],cos(dad[i]),mom[i]);
    quad(300,bro[i],101,40,sis[i],bro[i],(dad[i]),(mom[i]));
  }
}
