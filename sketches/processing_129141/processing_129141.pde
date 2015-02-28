
int i = 300;
int j = 0;
int k = 600;
int l = 300;
int m = 300;
int n = 0;
int o = 0;
int p = 300;
void setup (){
  size(600,600);
}

void draw(){
while(i<600){
 line(i,j,k,l);
 i=i+7;
 j=j+7;
 k=k-7;
 l=l+7;

}
while(m>0){
 line(m,n,o,p);
 m=m-7;
 n=n+7;
 o=o+7;
 p=p+7;
}

}



