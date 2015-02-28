
d/*

 * BiiZ Medya Sanat - Dijital Çizim Araçları
 * 4. İçiçe Daireler
 
 * test sayfası  : http://openprocessing.org/sketch/94050
 * media yazarı  : Baran Güleşen
 * kaynak : barangulesen.com 
 * tarih :  22.03.13
 
 
 NASIL ÇALIŞIR ?
  * D TUŞUNA BASARAK FIRÇANIN DAİRE ŞEKLİNDE ÇAPI ARTAR.
  * ÇİZİM BİTİNCE BOŞLUK TUŞU (UZUN TUŞ) İLE DAİRE ÇİZİM EKRANINDA ETKİSİZ OLUR.
  * TEKRAR ÇİZİM YAPMAK İÇİN D TUŞUNDA PARMAK BASILI KALIR.
  * ŞEKİL ÇİZME BİTİNCE BOŞLUK TUŞU DAİRE SONLANDIRILIP.
  * K TUŞU İLE BİLGİSAYARA ÇİZİMİNİZ KAYIT EDİLİR. 
  * DAIRENİN ÇAPININ BÜYÜME HIZINI KLAVYENİZDEN 1-2-3-4-5 TUŞLARINI KULLANARAK AYARLAYIN.  
 */

float baran;
float sbrn = 0.5;
void setup() {
  size(600, 600);
  smooth();
  background(255);
}
void draw() {
   if(keyPressed) {
  if (key == 'd' || key == 'D' ) {
    baran+=sbrn; 
 }else {
  baran = 0;
  }if (key == 'K' || key == 'k' ) {
    saveFrame("cizimler/BiiZ_Medya_Sanat_Dijital-####.tif"); 
 }
if (key == 't' || key == 'T' ) {
    background(255); }
}
if(keyPressed) {
if (key == '1' ) {
    sbrn = 0.5;
    baran+=sbrn;  
}
    
if (key == '2' ) {
    sbrn = 1;
    baran+=sbrn; }
}
    
 if (baran > 200 || baran < 0) {
    sbrn = sbrn * -1; }   
  arc(mouseX, mouseY, baran, baran, 0, TWO_PI);
}

