
//間隔をランダムに(auto9)
size(200,200);
int x;
int y;
int kankaku;

kankaku=int(random(10));
for(y=0; y<=200; y=y+kankaku) {
 line(0,y, 200,y);
 kankaku=int(random(10));
}



