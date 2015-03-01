
int i;
int j;
int a;
int b;
int c;
int d;
int e;
int asw;
int bsw;
int csw;
int dsw;

void draw() {
for(int i = 1; i<= 500000; i++) {
j = i;
a=0;
b=0;
c=0;
d=0;
e=0;
asw=0;
bsw=0;
csw=0;
dsw=0;
while(j%10!=0) {
j--;
}
if (j%10==0) {
a = i-j;
asw = 1;
}
while(asw ==1 && j%100 !=0) {
j = j-10;
}
if (j%100 == 0) {
b = i-j-a;
bsw = 1;
}
while (bsw ==1 && j%1000 !=0) {
j = j-100;
}
if (j%1000 == 0) {
c = i-j-b-a;
csw = 1;
}
while (csw ==1 && j%10000!=0) {
j = j-1000;
}
if (j%10000 == 0) {
d = i-j-c-b-a;
dsw = 1;
}
while (dsw ==1 && j%100000!=0) {
j = j-1000;
}
if (j%100000 == 0) {
e = i-j-d-c-b-a;
}
while (b%10 !=0) {
b = b/10;
}
while (c%10 !=0) {
c = c/10;
}
while (d%10 !=0) {
d = d/10;
}
while (e%10 !=0) {
e = e/10;
}
if (pow(a,5) + pow(b,5), + pow(c,5) + pow(d,5) + pow (e,5)) {
println(i);
sum = sum+i;
}
}
println("Done");
println(sum);
print(sum,10,10);
noLoop();
}







