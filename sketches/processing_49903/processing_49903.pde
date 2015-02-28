
int k;
int f=0;

class Baum {

  int cr=255;
  int cg=255;
  int cb=255;
  int nDepth;
  int maxDepth=7;
  float len=random(-17, -2);
  float X;
  float Y;
  
  public Baum(float X, float Y) {
    this.X=X;
    this.Y=Y;
  }
  
  void tree(int nDepth) {
    if (nDepth <=maxDepth) {
     
    fill(cr,cg, cb);
    stroke(cb,cr,cg);
    strokeWeight(k);
    
    ellipse(0,0,len,len);
    translate(0,len);
    
    pushMatrix();
    rotate(radians(mouseX));
    tree(nDepth+1);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-mouseY));
    tree(nDepth+1);
    popMatrix();
   }
  }
    void tree2(int nDepth) {
    if (nDepth <=maxDepth) {
     
    fill(cr,cg, cb);
    stroke(cb,cr,cg);
    strokeWeight(k);
    
    rect(0,0,len,len);
    translate(0,len);
    
    pushMatrix();
    rotate(radians(mouseX));
    tree2(nDepth+1);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-mouseY));
    tree2(nDepth+1);
    popMatrix();
   }
  }
    void tree3(int nDepth) {
    if (nDepth <=maxDepth) {
     
    fill(cr,cg, cb);
    stroke(cr,cg,cb);
    strokeWeight(k);
    
    line(0,0,len,len);
    translate(0,len);
    
    pushMatrix();
    rotate(radians(mouseX));
    tree3(nDepth+1);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-mouseY));
    tree3(nDepth+1);
    popMatrix();
   }
  }
    void tree4(int nDepth) {
    if (nDepth <=maxDepth) {
     
    fill(cr,cg, cb);
    stroke(cb,cr,cg);
    strokeWeight(k);
    
    triangle(0,0,len,len,0,len);
    translate(0,len);
    
    pushMatrix();
    rotate(radians(mouseX));
    tree4(nDepth+1);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-mouseY));
    tree4(nDepth+1);
    popMatrix();
   }
  }
  
  void zeichne() {
    if (f==0) {
    pushMatrix();
    translate(this.X,this.Y);
    this.tree(0);
    popMatrix();
    }
    else if (f==1) {
    pushMatrix();
    translate(this.X,this.Y);
    this.tree2(0);
    popMatrix();
    }
    else if (f==2) {
    pushMatrix();
    translate(this.X,this.Y);
    this.tree3(0);
    popMatrix();
    }
    else if (f==3) {
    pushMatrix();
    translate(this.X,this.Y);
    this.tree4(0);
    popMatrix();
    }
  }
  
  void FarbeWaehlen(){
    //blau
    if (width-780<mouseX && mouseX<width-750 && height-580<mouseY && mouseY<height-550 && mousePressed == true){
      cr=nDepth*10;
      cg=255-nDepth*10;
      cb=255;
    }
 
    //rot
    if (width-740<mouseX && mouseX<width-710 && height-580<mouseY && mouseY<height-550 && mousePressed == true) {
      cr=255;
      cg=nDepth*10;
      cb=50-nDepth*10;
    }
    
    //grün
    if (width-700<mouseX && mouseX<width-670 && height-580<mouseY && mouseY<height-550 && mousePressed == true) {
      cr=100-nDepth;
      cg=255;
      cb=nDepth*10;
    }
    
    //gelb
    if (width-660<mouseX && mouseX<width-630 && height-580<mouseY && mouseY<height-550 && mousePressed == true) {
      cr=255-nDepth;
      cg=255;
      cb=nDepth*10;
    }
    
    //orange
    if (width-620<mouseX && mouseX<width-590 && height-580<mouseY && mouseY<height-550 && mousePressed == true) {
      cr=255-nDepth;
      cg=140;
      cb=nDepth*10;
    }
}
  
  void Strichstaerke() {
    if (mpressed==false && width-490<mouseX && mouseX<width-390 && height-580<mouseY && mouseY<height-550 && mousePressed == true) {
        k++;
        if (k>=5) {
          k=0;
        }
          mpressed=true;
     }
   }
   
   void FormWaehlen() {
    if (form==false && width-380<mouseX && mouseX < width-280 && height-580<mouseY && mouseY<height-550 &&mousePressed == true) {
        f++;
        if (f>3) {
          f=0;
        }
          form=true;
     }
   }
   
}

