
int n=100;String d;void setup(){ size(n,n);try{int j=1/0;}catch(Exception e){d=e.getMessage();}textFont(loadFont("a.vlw"));background(0);fill(204, 102, 0);textSize(14);text(d, 10, 15);}


