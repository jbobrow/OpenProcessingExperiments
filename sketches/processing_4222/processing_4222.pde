
int i,a=150,q;
void b(int s){blend(0,((i+s)%3)*a,a,a,a,i*a,a,a,1<<s);}
void draw()
{if(q++<1)ellipse(a,a,a,a);filter(11);filter(17);
for(i=0;i<3;b(1),b(1),b(2),i++);
copy(a,0,a,a*3,0,0,a,a*3);}


