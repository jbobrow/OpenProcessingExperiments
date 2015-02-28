
void bubble() {


  if(mode==1) {
    wiggle=wiggle+random(.001,.005);
    if(wiggle>2) {
      mode=0;
    }
  }
  if(mode==0) {
    wiggle=wiggle-random(.001,.005); 
    if(wiggle<-2) {
      mode=1;
    }
  }

  for(int i=0;i<20;i++) {
    fill(170,70,Color[i],80);
    noStroke();

    rect(x[i],y[i],Size[i], Size[i]);
    y[i]=y[i]-speed[i];
    x[i]=x[i]+(wiggle*i/100);
    if (y[i]<-50)y[i]=700-speed[i];
  }
}


