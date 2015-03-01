
/*

 Palindromic Words v1
 
 aibohphobia - a joke word meaning "fear of palindromes" ) 
 
 */

import java.lang.StringBuilder;

String word = "aibohphobia";

void setup() {

  //boolean isItPoly = false;
  //isItPoly = (new StringBuilder(word).reverse().toString().toUpperCase().equals(word.toUpperCase()) == true) ? true:false; 
  //isItPoly = (new StringBuilder(word).reverse().toString().equals(word) == true) ? true:false; 
  
  println("word:", word, "palindromic:", YesNo(new StringBuilder(word).reverse().toString().equals(word)));
  
  //println("word:", word, "palindromic:", YesNo(isItPoly));

}

String YesNo(boolean v) {
  String[] state = {
    "no", "yes"
  };  
  return (state[int(v)]);
}



