
int kgi;
kgi=500;

int suja;
suja=50;

size(kgi,kgi);
smooth();
translate(width/2, height/2);
for(int i=0; i<360; i+=30){
rotate(radians(30));
line(0,0,suja,suja);
fill(0);
triangle(suja,suja,suja+4,suja+1,suja,suja+5);
}
