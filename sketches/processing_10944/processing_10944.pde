
//背景のサイズ
size(1024,768);

//カラーモードの指定
colorMode(RGB,256);

//背景色の指定
background(44,44,44);

//枠線なし
noStroke();
//rectModeの変更
rectMode(CORNER);
//マージン、パディングの設定
int marginX = 27;
int marginY = 64;
int padding = 20;
color cRect;
//矩形のサイズ変更
int rectSize = 145;

//color型を入れる配列
color [] colors = new color[24];
//

colors[0] = color(115 ,82 ,68);
colors[1] = color(194 ,150 ,130);
colors[2] = color(98 ,122 ,157);
colors[3] = color(87 ,108 ,67);
colors[4] = color(133 ,128 ,177);
colors[5] = color(103 ,189 ,170);
colors[6] = color(214 ,126 ,44);
colors[7] = color(80 ,91 ,166);
colors[8] = color(193 ,90 ,99);
colors[9] = color(94 ,60 ,108);
colors[10] = color(157 ,188 ,64);
colors[11] = color(224 ,163 ,46);
colors[12] = color(56 ,61 ,150);
colors[13] = color(70 ,148 ,73);
colors[14] = color(175 ,54 ,60);
colors[15] = color(231 ,199 ,31);
colors[16] = color(187 ,86 ,149);
colors[17] = color(8 ,133 ,161);
colors[18] = color(243 ,243 ,242);
colors[19] = color(200 ,200 ,200);
colors[20] = color(160 ,160 ,160);
colors[21] = color(122 ,122 ,121);
colors[22] = color(85 ,85 ,85);
colors[23] = color(52 ,52 ,52);

//指定位置に矩形を描画
for(int y = 0; y< 4; y++)
{
  for(int x = 0; x < 6; x++)
  {
    fill(colors[y*6+x]);
    
    rect(marginX + x*(rectSize + padding), marginY + y*(rectSize+padding), rectSize, rectSize);
  }  

}




