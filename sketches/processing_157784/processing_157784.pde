
int r=0,g=0,b=0; 
boolean rstage=true; 
boolean ystage=false; 
boolean gstage=false;
boolean cystage=false; 
boolean bstage=false;
boolean pstage=false; 
boolean rrstage=false; 


void setup(){
  background(0);
  size(500,500);
  frameRate(10);
  println("rstageon"); 
}

void draw(){
  
  
  int c=25;
  for (int i=0;i<10;i++){
     int a=25;
    for(int j=0;j<10;j++){
      noStroke();
      fill(r,g,b); 
      ellipse(a,c,40,40);
      a+=50;
      
      if(rstage==true)
        r+=11; 
      else if(ystage==true)
        g+=11; 
      else if(gstage==true)
        r-=11;  
      else if(cystage==true)
        b+=11; 
      else if(bstage==true)
        g-=11; 
      else if(pstage==true)
        r+=11;
      else if(rrstage==true)
        b-=11;
      else 
        println("Issuse no stage set"); 
        
      if (r>=250 && rstage==true){
        ystage=true; 
        r=250;
        rstage=false; 
        println("ystageon"); 
      }
      if(ystage==true && g>=250){
        ystage=false; 
         gstage=true;  
         g=250;
         println("gstageon"); 
      }
      if(gstage==true && r<=0){
        gstage=false; 
        cystage=true; 
        r=0;
        println("cystageon"); 
      }
      if( cystage==true && b>=250){
        cystage=false; 
        bstage=true; 
        b=250;
        println("bstageon"); 
      }
      if(bstage==true && g<=0){
        bstage=false; 
        pstage=true; 
        g=0;
        println("pstageon"); 
      }
      if(pstage==true && r>=250){
        pstage=false; 
        rrstage=true; 
        r=250;
        println("rrstageon"); 
      }
      if(rrstage==true && b<=0){
        rrstage=false; 
        ystage=true;
        b=0;
        println("ystageon"); 
      }
      
    }
    c+=50;
  }
  
  
}



