
int[] data = {50, 75, 95};
int barWidth = 20;
int margin = 10;

size(200,200);
background(255,255,255,);
fill(0,0,128);

for (int i=0;i<data. length;i++){
    rect(i*(margin+barWidth),height-data[i],barWidth,height);
}
