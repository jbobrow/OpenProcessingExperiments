
int[] ayatlist = { 7, 286, 200, 176, 120, 165, 206, 75, 127, 109, 123, 111, 43, 52, 99, 128, 111, 110, 98, 135, 112, 78, 118, 64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20, 56, 40, 31, 50, 40, 46, 42, 29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8, 8, 11, 11, 8, 3, 9, 5, 4, 7, 3, 6, 3, 5, 4, 5, 6, 0 };


int[] sumayat = {};
int[] sumsura = {};
int[] sum_1_1_2_2 = {};
int[] sum_1_2_2_1 = {};

int total = 114; //Общее количество шестигранников
float r = 25; // радиус шестигранника
int q = 1; // при каждом нажатии меню справа добавляется один пункт 
int menu_item;

boolean m_over = false;

// Алгоритмы построения цветка
String[] cloner_type = {"full-hex", "half-hex-sura", "half-hex-ayat", "hex-1_1_2_2", "hex-1_2_2_1", "hex-1_1_2_2"};

// Счетчик алгоритма построения цветка
int cloner_event = 0;

void setup()
{ 
  //Настройки экрана
  size(1200, 800);
  background(255);
  smooth();
  frameRate(25);
  
}

void draw(){
  background(255);
  menu(798, 344, 30); 
  sum_menu(373, 392, 70, 70, color(201, 0, 116));
  //coordmouse();
  cloner(cloner_type[cloner_event]);
  
}


void mousePressed(){
  if (m_over == true){// активен только для меню
    q = menu_item+2; // добавляем один пункт
    for (int i = 0; i < 4; i++){
      if(menu_item == i){
        cloner_event = i+1; // при нажатии на меню загружаем из массива событие
      }
    }
    if(menu_item == 4){
      cloner_event = 0;
      sumayat = new int[0];
      sumsura = new int[0];
      sum_1_1_2_2 = new int[0];
      sum_1_2_2_1 = new int[0];
      q = 1; // стираем менюшки
    }
  }
}

// Меню сумм
void sum_menu(int x, int y, int space_x, int space_y, color col){
  
  // Меняем цвета в зависимости от того какой пункт меню кликнут
  color col1, col2, col3, col4;
  if(cloner_event == 1){col1 = col;}else{col1 = (0);}
  if(cloner_event == 2){col2 = col;}else{col2 = (0);}
  if(cloner_event == 4){col3 = col;}else{col3 = (0);}
  if(cloner_event == 3){col4 = col;}else{col4 = (0);}  
  
  // При наведении меняем событие cloner event
  if(sumsura.length > 0 && sumayat.length > 0 && sum_1_2_2_1.length > 0 && sum_1_1_2_2.length > 0 ){
    if (mouseOverCircle(x, y, 50)) { cloner_event = 1; }
    if (mouseOverCircle(x+space_x, y, 50)) { cloner_event = 2; }
    if (mouseOverCircle(x, y+space_y, 50)) { cloner_event = 4; }
    if (mouseOverCircle(x+space_x, y+space_y, 50)) { cloner_event = 3; }
    textFont(createFont("Tahoma", 15));
    textAlign(CENTER);
    text("наведите мышь на суммы", 415, 420);// текст
  }
  // В блок sum_arr забиваем данные 
  sum_arr(col1, sumsura, x, y);
  sum_arr(col2, sumayat, x+space_x, y);
  sum_arr(col3, sum_1_2_2_1, x, y+space_y);
  sum_arr(col4, sum_1_1_2_2, x+space_x, y+space_y);
}

// Текствой блок в который можем добавить масив
void sum_arr(color col, int[] sum, int t_x, int t_y){
  int s = 0; 
  for(int i = 0; i < sum.length; i++){// Суммируем весь массив
    s = s + sum[i];
  }
  textFont(createFont("Tahoma", 20));
  textAlign(CENTER);  
  fill(col);
  text(s, t_x, t_y);
}



boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
}

boolean mouseOverCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);
}

void cloner(String typehex){
  
  textFont(createFont("Tahoma", 12));
  int colchk = 0;  
  int n = 0;
  int d = 1;
  float m = r/(sqrt(3)/2);
  float k = sqrt(pow(2*r, 2)-pow(r, 2));
  float global_x = width/2-400;
  float global_y = height/2;
  float hex_x = global_x;
  float hex_y = global_y;  
  
  float[] prev_hex_x = new float[total+2]; //следущие координаты относительно предыдущих
  float[] prev_hex_y = new float[total+2];
  prev_hex_x[0] = global_x;
  prev_hex_x[1] = global_x;
  prev_hex_y[0] = global_y;
  prev_hex_y[1] = global_y; 
  
  // Создаем массив от 1 до 114
  int[] syry_pnum = {};
  for(int i=0; i < 114; i++){
    syry_pnum = append(syry_pnum, i+1);
  }

  // Создаем массив два чета и два нечета, нечет-чет, чет-нечет
  int[] arr_1_1_2_2 = {};
  int[] arr_1_2_2_1 = {};  
  
  for(int i=0; i < 114; i++){
    if (syry_pnum[i] %2 == 0){ // Сура чет
      if (ayatlist[i] %2 == 0){ // Аят чет
        arr_1_1_2_2 = append(arr_1_1_2_2, syry_pnum[i]);
        arr_1_1_2_2 = append(arr_1_1_2_2, ayatlist[i]);
      }
      else{// Аят нечет
        arr_1_2_2_1 = append(arr_1_2_2_1, syry_pnum[i]);
        arr_1_2_2_1 = append(arr_1_2_2_1, ayatlist[i]);
      }
    }
    else{// Сура нечет
      if (ayatlist[i] %2 == 0){ // Аят чет
        arr_1_2_2_1 = append(arr_1_2_2_1, syry_pnum[i]);
        arr_1_2_2_1 = append(arr_1_2_2_1, ayatlist[i]);
      }
      else{ // Аят нечет
        arr_1_1_2_2 = append(arr_1_1_2_2, syry_pnum[i]);
        arr_1_1_2_2 = append(arr_1_1_2_2, ayatlist[i]);
      }      
    }
  }
  
  
  textAlign(CENTER);
  
  for(int h=1; h <= 6; h++){
    
    for (int i=1; i <= 19; i++){
      
      while( i >= 3*n*(n-1)+2){
        n = n+1;
      }
                
      int a = n - 1;
     
      // Правило 1
      if (i >= 3*a*(a-1) + 5*a +2){ // интервал от
        if (i <= 3*(a+1)*((a+1)-1)+2){ // интервал до
             hex_x = prev_hex_x[i];
             hex_y = prev_hex_y[i] - 2*r;
        }
      }
          
      // Правило 1 конечная цифра интервала
      if (i == 3*a*(a-1)+2){
             hex_x = prev_hex_x[i] ;
             hex_y = prev_hex_y[i] - 2*r;
      }       
          
      // Правило 2
      if (i >= 3*a*(a-1)+a+2){//интервал от
        if (i <= 3*a*(a-1) + 2*a + 1){// интервал до
            hex_x = prev_hex_x[i] + k;
            hex_y = prev_hex_y[i] + r;
        }
      }
                  
      // Правило 3
      if (i >= 3*a*(a-1) + 2*a + 2){// интервал от
          if (i <= 3*a*(a-1) + 3*a + 1){ // интервал до
              hex_x = prev_hex_x[i];
              hex_y = prev_hex_y[i] + 2*r;
          }
      }
                  
      // Правило 4
      if (i >= 3*a*(a-1) + 3*a + 2) {// интервал от
          if (i <= 3*a*(a-1) + 4*a + 1){//интервал до
              hex_x = prev_hex_x[i] - k;
              hex_y = prev_hex_y[i] + r;
          }
      }
              
      // Правило 5
      if (i >= 3*a*(a-1) + 4*a + 2){// интервал от
          if (i <= 3*a*(a-1) + 5*a + 1){// интервал до
              hex_x = prev_hex_x[i] - k;
              hex_y = prev_hex_y[i] - r;
          }
      }
      
      // Правило 6
      if (i >= 3*a*(a-1)+3){//интервал от
          if (i <= 3*a*(a-1)+a+1){//интервал до
              hex_x = prev_hex_x[i] + k;
              hex_y = prev_hex_y[i] - r;
          }
      }
      prev_hex_x[i+1] = hex_x;
      prev_hex_y[i+1] = hex_y;    

      noStroke();
      // Гексагон
      fill(200);
      if(typehex == "full-hex"){
        polygon(6, hex_x, hex_y, r);
      }
      if(typehex == "half-hex-sura"){
        if(sumsura.length < 114){
          sumsura = append(sumsura, d);
        }
        fill(209, 0, 124);
        halfpolygon(6, hex_x, hex_y, r, 180);
        fill(200);
        halfpolygon(6, hex_x, hex_y, r, 0);
      }
      if(typehex == "half-hex-ayat"){
        if(sumayat.length < 114){
          sumayat = append(sumayat, ayatlist[d-1]);
        }
        fill(209, 0, 124);
        halfpolygon(6, hex_x, hex_y, r, 0);
        fill(200);
        halfpolygon(6, hex_x, hex_y, r, 180);
      }
      if(typehex == "hex-1_1_2_2"){
        
        if (d %2 == 0){ // Сура чет
          if (ayatlist[d-1] %2 == 0){ // Аят чет
            sum_1_1_2_2 = arr_1_1_2_2;
            fill(209, 0, 124);
          }else{// Аят нечет
            fill(200);
          }
        }
        else{// Сура нечет
          if (ayatlist[d-1] %2 == 0){ // Аят чет
            fill(200);
          }else{ // Аят нечет
            sum_1_1_2_2 = arr_1_1_2_2;
            fill(209, 0, 124);
          }      
        }
        polygon(6, hex_x, hex_y, r);
      }
      if(typehex == "hex-1_2_2_1"){
        if (d %2 == 0){ // Сура чет
          if (ayatlist[d-1] %2 == 0){ // Аят чет
            fill(200);
          }else{// Аят нечет
            sum_1_2_2_1 = arr_1_2_2_1;
            fill(209, 0, 124);
          }
        }
        else{// Сура нечет
          if (ayatlist[d-1] %2 == 0){ // Аят чет
            sum_1_2_2_1 = arr_1_2_2_1;
            fill(209, 0, 124);
          }else{ // Аят нечет
            fill(200);
          }      
        }
        polygon(6, hex_x, hex_y, r);
      }
      
      // Текст cура
      fill(255);
      text(d, hex_x, hex_y-6);
      text(ayatlist[d-1], hex_x, hex_y+16);
      stroke(255);
      line(hex_x-r, hex_y, hex_x+r, hex_y);
      d = d+1;
    }
    if (d == 20){
        hex_x = global_x+4*m+m/2;
        hex_y = global_y-7*r;}
    if (d == 39){
        hex_x = global_x+12*m;
        hex_y = global_y-6*r;}
    if (d == 58){
        hex_x = global_x+15*m;
        hex_y = global_y+2*r;}
    if (d == 77){
        hex_x = global_x+10*m+m/2;
        hex_y = global_y+9*r;}
    if (d == 96){
        hex_x = global_x+3*m;
        hex_y = global_y+8*r;}
    n = 0;
  }
}
// Темповый инструмент можно добавлять любую переменную для проверки
void coordmouse(){
  textFont(createFont("Tahoma", 12));
  textAlign(LEFT);
  fill(255, 0, 0);
  text(mouseX, mouseX, mouseY-12);
  text(mouseY, mouseX+25, mouseY-12);
}
void halfpolygon(int n, float cx, float cy, float radius, float ang)
{
  float angle = 360 / n;

  beginShape();
  for (int i = 0; i < 4; i++)
  {
    vertex(cx + radius * cos(radians(angle * i + ang)),
      cy + radius * sin(radians(angle * i + ang)));
    endShape(CLOSE);
  }
}
void menu(int menu_x, int menu_y, int line_h){
  textFont(createFont("Tahoma", 15));
  textAlign(LEFT);
  // Наименования меню
  String[] menu = {"1. Сумма порядковых номеров сур",
  "2. Сумма аятов",
  "3. Сумма чет-чет, нечет-нечет",
  "4. Сумма нечет-чет, чет-нечет",
  "Сброс результатов"};
  // Строим меню
  for (int i = 0; i < menu.length && i < q; i++){
    int r_width = 300;
    int r_y = menu_y+line_h*i-14;
    fill(235);
    noStroke();
    // закрашиваем прямоугольник при наведении
    if(mouseX > menu_x && mouseX < menu_x+r_width ){
      if(mouseY > r_y && mouseY < r_y+line_h){      
        m_over = true; // детектор нажатия мыши на это меню
        fill(200);
        menu_item = i; // детектор на каком подменю находится мышь
      }
    }else{
      m_over = false; // вне меню детектор не срабатывает
    }
    rect(menu_x, r_y, 300, 20);// кнопка
    fill(0);
    text(menu[i], menu_x, menu_y + line_h*i);// текст
  }
}
void polygon(int n, float cx, float cy, float radius)
{
  float angle = 360 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + radius * cos(radians(angle * i)),
      cy + radius * sin(radians(angle * i)));  
  }
  endShape(CLOSE);
}



