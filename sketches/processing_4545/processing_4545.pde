
int[][] d=new int[49][2];int i,a,b;void draw(){for(i=0;i<49;i++){stroke(99);point(a=d[i][0],b=d[i][1]);stroke(0);point(d[i][0]+=random(5)*(2*int(mouseX>a)-1),d[i][1]+=random(5)*(2*int(mouseY>b)-1));}}

