
int count = 0;
int no = 1000;
float[][] en = new float[no][2]; //å��ã�®ä½�ç½®ã��ä¿�æ��ã��ã��é��å��
float[][] enp = new float[no][2]; //å��ã�®ï¼�å��å��ã�®ä½�ç½®ã��ä¿�æ��ã��ã��é��å��
float[][] env = new float[no][2]; //å��ã�®é��åº¦ã��ä¿�æ��ã��ã��é��å��
float[][] endisp = new float[no][2]; //å��ã�®è¡¨ç¤ºç�¨
float rsep, thr; //å��é�¢ã�®è·�é�¢ç¯�å�²ï¼�è¨�ç®�ç¯�å�²è§�åº¦
int nRate; //ç�¾å�¨ã�®frameRateã�§ä½�ã�«ã�¦ã�³ã��ã�§æ�¥è¿�ã��ã��ã��ï¼�
int drawCount;

float[] vc = new float[2];
float[] va = new float[2];
float[] vs = new float[2];
float[] vm = new float[2];
int ellipseSize = 3;

//Gains
float kv = 0.8;
float kc = 20.0;
float ka = 1.0;
float ks = 2.0;
float km = 0.5;

float r = 150; //å�¨è¾ºã�®è¨�ç®�ç¯�å�²è·�é�¢
float th = 90; //å�¨è¾ºã�®è¨�ç®�ç¯�å�²è§�åº¦

void setup() {
size(500, 500); //Canvasã�µã�¤ã�ºã�®è¨­å®�
background(225); //è��æ�¯è�²ã�®è¨­å®�
int fr = 10; //frameRateã�®è¨­å®�
frameRate(fr); //frameRateã�®è¨­å®�
for(int i=0; i<no; i++){
en[i][0] = int(random(0,500));
en[i][1] = int(random(0,500)); //å��ã�®å��æ��ä½�ç½®
enp[i][0] = en[i][0]-random(-50,50); //å��ã�®ï¼�å��å��ã�®å��æ��ä½�ç½®
enp[i][1] = en[i][1]-random(-50,50); //å��ã�®ï¼�å��å��ã�®å��æ��ä½�ç½®
//env[i][0] = 10; //å��ã�®é��åº¦ã�®å��æ��å�¤
//env[i][1] = 0; //å��ã�®é��åº¦ã�®å��æ��å�¤
ellipse(en[i][0], en[i][1], 20, 20); //å��ã�®æ��ç�»
}
thr = th/180*PI; //radã�¸å¤�æ��
rsep = ellipseSize * 3; //separation limit
int sec = 3; //ä½�ç§�ã�§è¨�ç®�ä½�ç½®ã�¸ç§»å��ã��ã��ã��ï¼�
nRate = sec * fr; //ç�¾å�¨ã�®frameRateã�§ä½�ã�«ã�¦ã�³ã��ã�§æ�¥è¿�ã��ã��ã��ï¼�
drawCount = 0;
}

void draw() {
drawCount++;

background(225);
for(int i=0; i<no; i++){
env[i][0] = en[i][0] - enp[i][0];
env[i][1] = en[i][1] - enp[i][1];
enp[i][0] = en[i][0];
enp[i][1] = en[i][1];
}
for(int i=0; i<no; i++){
vc = cohesion(i);
va = alignment(i);
vs = separation(i);
vm = minimumVel(i);

en[i][0] += env[i][0]*kv+vc[0]*kc+va[0]*ka+vs[0]*ks+vm[0]*km;
en[i][1] += env[i][1]*kv+vc[1]*kc+va[1]*ka+vs[1]*ks+vm[1]*km;
endisp[i][0] = en[i][0]%width;
endisp[i][1] = en[i][1]%height;

if(endisp[i][0] < 0){

endisp[i][0] += width;

}

if(endisp[i][1] < 0){

endisp[i][1] += height;

}
ellipse(endisp[i][0], endisp[i][1], ellipseSize, ellipseSize);
};
}

float minVel = 7;
float[] minimumVel(int i){
float[] minv = new float[2];
if((env[i][0] < minVel) && (env[i][0] > 0)){
minv[0] = minVel;
}else{
if((env[i][0] > -minVel) && (env[i][0] <= 0)){
minv[0] = -minVel;
}
}
if((env[i][1] < minVel) && (env[i][1] > 0)){
minv[1] = minVel;
}else{
if((env[i][1] > -minVel) && (env[i][1] <= 0)){
minv[1] = -minVel;
}
}
return minv;
}

//å�¨ã��ã�®å��ã�®é��å¿�ã�«å��ã��ã�£ã�¦ç§»å��ã��ã��
float[] cohesion(int i){
float[] sum = new float[2];
float[] ave = new float[2];
float[] vcohesion = new float[2];
sum[0] = 0;
sum[1] = 0;
ave[0] = 0;
ave[1] = 0;
count = 0;
for(int j=0; j<no; j++){
if(j!=i){
float dex = en[i][0]-en[j][0];
float dey = en[i][1]-en[j][1];
float d = sqrt(pow(dex, 2)+pow(dey, 2));
if(d < r){
float innerProduct = env[i][0]*dex+env[i][1]*dey;
float absa = sqrt(pow(env[i][0], 2)+pow(env[i][1], 2));
float absb = d;
float theta = acos(innerProduct/absa/absb);
if(theta <= thr){
count++;
sum[0] = sum[0] + en[j][0];
sum[1] = sum[1] + en[j][1];
}
}
};
};
if(count != 0){
ave[0] = sum[0]/count;
ave[1] = sum[1]/count;
vcohesion[0] = (ave[0]-en[i][0])/(float(nRate));
vcohesion[1] = (ave[1]-en[i][1])/(float(nRate));
}else{
vcohesion[0] = 0;
vcohesion[1] = 0;
};
return vcohesion;
}

//å�¨ã��ã�®å��ã�®é��åº¦ã�«å��ã��ã��ã��
//å�¨ã��ã�®å��ã�®é��åº¦ã��è¨�ç®�ã��ï¼�ç�¾å�¨é��åº¦ã��ã��ã��ã�®é��åº¦ã�«ã�ªã��ã��ã��ã�«å¤�æ�´ã��ã�¦ã��ã��
float[] alignment(int i){
float[] sum = new float[2];
float[] ave = new float[2];
float[] valignment = new float[2];
sum[0] = 0;
sum[1] = 0;
ave[0] = 0;
ave[1] = 0;
count = 0;
for(int j=0; j<no; j++){
if(j!=i){
float dex = en[i][0]-en[j][0];
float dey = en[i][1]-en[j][1];
float dexv = env[i][0]-env[j][0];
float deyv = env[i][1]-env[j][1];
float d = sqrt(pow(dex, 2)+pow(dey, 2));
if(d < r){
float innerProduct = env[i][0]*dex+env[i][1]*dey;
float absa = sqrt(pow(env[i][0], 2)+pow(env[i][1], 2));
float absb = d;
float theta = acos(innerProduct/absa/absb);
if(theta <= thr){
count++;
sum[0] = sum[0] + env[j][0];
sum[1] = sum[1] + env[j][1];
}
}
};
};
if(count != 0){
ave[0] = sum[0]/count;
ave[1] = sum[1]/count;
valignment[0] = (ave[0]-env[i][0])/(float(nRate));
valignment[1] = (ave[1]-env[i][1])/(float(nRate));
}else{
valignment[0] = 0;
valignment[1] = 0;
};

return valignment;
}

//ã��ã�¾ã��è¿�ã�¥ã��é��ã��ã�ªã��ã��ã��ã�«ã��ã��
float[] separation(int i){
float[] sum = new float[2];
float[] ave = new float[2];
float[] vseparation = new float[2];

vseparation[0] = 0;
vseparation[1] = 0;

sum[0] = 0;
sum[1] = 0;
ave[0] = 0;
ave[1] = 0;
count = 0;
for(int j=0; j<no; j++){

if(j!=i){
float dex = en[i][0]-en[j][0];
float dey = en[i][1]-en[j][1];
float dsep = sqrt(pow(dex, 2)+pow(dey, 2));
if(dsep < rsep){
count++;
float dd = rsep - dsep;
sum[0] = sum[0] + dex*dd;
sum[1] = sum[1] + dey*dd;
}
};
};
if(count != 0){
ave[0] = sum[0]/count;
ave[1] = sum[1]/count;
vseparation[0] = (ave[0])/(float(nRate));
vseparation[1] = (ave[1])/(float(nRate));
}else{
vseparation[0] = 0;
vseparation[1] = 0;
};
return vseparation;

}
