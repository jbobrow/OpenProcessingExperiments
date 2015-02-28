
int count = 0;
int no = 25;
float[][] en = new float[no][2]; //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¤Â½ï¿½Ã§Â½Â®Ã£ï¿½ï¿½Ã¤Â¿ï¿½Ã¦ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã©ï¿½ï¿½Ã¥ï¿½ï¿½
float[][] enp = new float[no][2]; //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¯Â¼ï¿½Ã¥ï¿½ï¿½Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¤Â½ï¿½Ã§Â½Â®Ã£ï¿½ï¿½Ã¤Â¿ï¿½Ã¦ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã©ï¿½ï¿½Ã¥ï¿½ï¿½
float[][] env = new float[no][2]; //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½ï¿½Ã¤Â¿ï¿½Ã¦ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã©ï¿½ï¿½Ã¥ï¿½ï¿½
float r, th, thr; //Ã¥ï¿½Â¨Ã¨Â¾ÂºÃ£ï¿½Â®Ã¨Â¨ï¿½Ã§Â®ï¿½Ã§Â¯ï¿½Ã¥ï¿½Â²Ã¨Â·ï¿½Ã©ï¿½Â¢Ã¯Â¼ï¿½Ã¨Â¨ï¿½Ã§Â®ï¿½Ã§Â¯ï¿½Ã¥ï¿½Â²Ã¨Â§ï¿½Ã¥ÂºÂ¦
int nRate; //Ã§ï¿½Â¾Ã¥ï¿½Â¨Ã£ï¿½Â®frameRateÃ£ï¿½Â§Ã¤Â½ï¿½Ã£ï¿½Â«Ã£ï¿½Â¦Ã£ï¿½Â³Ã£ï¿½ï¿½Ã£ï¿½Â§Ã¦ï¿½Â¥Ã¨Â¿ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã¯Â¼ï¿½
int drawCount;

float[] vc = new float[2];
float[] va = new float[2];
float[] vs = new float[2];
int ellipseSize = 20;

void setup() {
    size(500, 500); //CanvasÃ£ï¿½ÂµÃ£ï¿½Â¤Ã£ï¿½ÂºÃ£ï¿½Â®Ã¨Â¨Â­Ã¥Â®ï¿½
    background(225); //Ã¨ï¿½ï¿½Ã¦ï¿½Â¯Ã¨ï¿½Â²Ã£ï¿½Â®Ã¨Â¨Â­Ã¥Â®ï¿½
    int fr = 10; //frameRateÃ£ï¿½Â®Ã¨Â¨Â­Ã¥Â®ï¿½
    frameRate(fr); //frameRateÃ£ï¿½Â®Ã¨Â¨Â­Ã¥Â®ï¿½
    for(int i=0; i<no; i++){
        en[i][0] = int(random(0,500));
        en[i][1] = int(random(0,500)); //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã¦ï¿½ï¿½Ã¤Â½ï¿½Ã§Â½Â®
        enp[i][0] = en[i][0]-random(-50,50); //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¯Â¼ï¿½Ã¥ï¿½ï¿½Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã¦ï¿½ï¿½Ã¤Â½ï¿½Ã§Â½Â®
        enp[i][1] = en[i][1]-random(-50,50); //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¯Â¼ï¿½Ã¥ï¿½ï¿½Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã¦ï¿½ï¿½Ã¤Â½ï¿½Ã§Â½Â®
        //env[i][0] = 10; //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã¦ï¿½ï¿½Ã¥ï¿½Â¤
        //env[i][1] = 0; //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã¦ï¿½ï¿½Ã¥ï¿½Â¤
        ellipse(en[i][0], en[i][1], 20, 20); //Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã¦ï¿½ï¿½Ã§ï¿½Â»
    }
    thr = th/180*PI; //radÃ�ï¿½Ã�Â£Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¸Ã�ï¿½Ã�Â¥Ã�ï¿½Ã�Â¤Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¦Ã�Â¯Ã�Â¿Ã�Â½Ã�Â¯Ã�Â¿Ã�Â½
    r = 120; //Ã¥ï¿½Â¨Ã¨Â¾ÂºÃ£ï¿½Â®Ã¨Â¨ï¿½Ã§Â®ï¿½Ã§Â¯ï¿½Ã¥ï¿½Â²Ã¨Â·ï¿½Ã©ï¿½Â¢
    th = 90; //Ã¥ï¿½Â¨Ã¨Â¾ÂºÃ£ï¿½Â®Ã¨Â¨ï¿½Ã§Â®ï¿½Ã§Â¯ï¿½Ã¥ï¿½Â²Ã¨Â§ï¿½Ã¥ÂºÂ¦
    thr = th/180*PI; //radÃ£ï¿½Â¸Ã¥Â¤ï¿½Ã¦ï¿½ï¿½
    rsep = ellipseSize * 2; //separation limit
    //println(thr);
    int sec = 3; //Ã¤Â½ï¿½Ã§Â§ï¿½Ã£ï¿½Â§Ã¨Â¨ï¿½Ã§Â®ï¿½Ã¤Â½ï¿½Ã§Â½Â®Ã£ï¿½Â¸Ã§Â§Â»Ã¥ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã¯Â¼ï¿½
    nRate = sec * fr; //Ã§ï¿½Â¾Ã¥ï¿½Â¨Ã£ï¿½Â®frameRateÃ£ï¿½Â§Ã¤Â½ï¿½Ã£ï¿½Â«Ã£ï¿½Â¦Ã£ï¿½Â³Ã£ï¿½ï¿½Ã£ï¿½Â§Ã¦ï¿½Â¥Ã¨Â¿ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã¯Â¼ï¿½
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

en[i][0] += env[i][0]+vc[0]+va[0]+vs[0];
en[i][1] += env[i][1]+vc[1]+va[1]+vs[1];
if(en[i][0] > width){
en[i][0] -= width;
}else{
if(en[i][0] < 0){
en[i][0] += width;
}
}
if(en[i][1] > height){
en[i][1] -= height;
}else{
if(en[i][1] < 0){
en[i][1] += height;
}
}
ellipse(en[i][0], en[i][1], ellipseSize, ellipseSize);
};
}

//Ã¥ï¿½Â¨Ã£ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥Â¿ï¿½Ã£ï¿½Â«Ã¥ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â£Ã£ï¿½Â¦Ã§Â§Â»Ã¥ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½
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

//Ã¥ï¿½Â¨Ã£ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½Â«Ã¥ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½
//Ã¥ï¿½Â¨Ã£ï¿½ï¿½Ã£ï¿½Â®Ã¥ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½ï¿½Ã¨Â¨ï¿½Ã§Â®ï¿½Ã£ï¿½ï¿½Ã¯Â¼ï¿½Ã§ï¿½Â¾Ã¥ï¿½Â¨Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â®Ã©ï¿½ï¿½Ã¥ÂºÂ¦Ã£ï¿½Â«Ã£ï¿½ÂªÃ£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â«Ã¥Â¤ï¿½Ã¦ï¿½Â´Ã£ï¿½ï¿½Ã£ï¿½Â¦Ã£ï¿½ï¿½Ã£ï¿½ï¿½
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

//Ã£ï¿½ï¿½Ã£ï¿½Â¾Ã£ï¿½ï¿½Ã¨Â¿ï¿½Ã£ï¿½Â¥Ã£ï¿½ï¿½Ã©ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ÂªÃ£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½ï¿½Ã£ï¿½Â«Ã£ï¿½ï¿½Ã£ï¿½ï¿½
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
