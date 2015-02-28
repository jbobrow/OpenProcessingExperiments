
//e t a o h n i s r d l u w m c g f y p v k b j x z q

Text txt;
char[] alphabet = { 
  'e','t','a','o','h','n','i','s','r','d','l','u','w','m','c','g','f','y','p','v','k','b','j','x','z','q'
};
int[] alphabet_val = {
  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26
};

int count;
int start;
int level=0;

void setup() {
  txt = new Text(loadStrings("script.txt"));
  size(800,800);
}

void draw() {
  for (int i = 0; i < txt.paragraphs.length; i++) {
    //println(txt.paragraphs.length);
    //println(txt.paragraphs[i].sentences[i].words[i].chars[1]);
    for (int j = 0; j < txt.paragraphs[i].sentences.length; j++) {
      for (int l = 0; l < txt.paragraphs[i].sentences[j].words.length; l++) {
        for (int m = 0; m < txt.paragraphs[i].sentences[j].words[l].chars.length; m++) {

          println(txt.paragraphs[i].sentences[j].words[l].chars[m]);

          for (int n = 0; n < alphabet.length; n++) {
            if (txt.paragraphs[i].sentences[j].words[l].chars[m] == (alphabet[n])) {
              count = count + alphabet_val[n];
            }
          } 
          //          int values[] = append(count);
   //       for (int p = 0; p<= m; p++) {
            rect(start*20,level,20,count);
            start++;
            count=0;
            if (start == 800) {
              start = 0;
              level = level+10;
        //    }
          }
        }
      }
    }
  }
}



//if (println(txt.paragraphs[i].sentences[i].words[i].chars[j].equals(alphabet[k])){
// value_ring = value_ring + values[k];


