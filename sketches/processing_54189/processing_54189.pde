
import processing.pdf.*;

String zauberlehrling;
color c;
int[] result = {
};
int[] results;
int resultIndex = 0;
float x = 10;
float y = 10;
float w = 1;
float h = 10;

color bgColor;

Boolean foundResult = false;

void setup() {
  size(700, 400);
  smooth();

  // MANIPULATE
  bgColor = color(210);
  // load the file, with the searchwords 
  // set a color
  // save a pdf
  String[] searchWords = loadStrings("safety.txt");
  c = color(255, 0, 0);
  beginRecord(PDF, "safety.pdf"); 
  // END

  // loads a file, each line will be a row in the new string array
  String[] lines = loadStrings("clockworkorange.txt");

  // join all lines into one long string, separating the with a newline character (\n)
  zauberlehrling = join(lines, "\n").toLowerCase();

  for (int i = 0; i < searchWords.length; i++) {
    searchWords[i] = searchWords[i].toLowerCase();

    if (results != null)
      results = concat(results, find(searchWords[i], zauberlehrling));
    else
      results = find(searchWords[i], zauberlehrling);
  }

  results = sort(results);

  // remove duplitated entrys
  for (int v = 0 ; v < results.length ; v++) {
    if (findDuplicates(results, v) < 3)
      result = append(result, results[v]);
  }

  // the resuls int array stores the indices of all found matches, making the array length the number of results
  println("Found " + result.length);

  // draw only once
  noLoop();
}

void draw() {
  background(255);

  for (int i = 0; i < zauberlehrling.length(); i++) {
    if (resultIndex < result.length && i == result[resultIndex]) {
      resultIndex++;
      foundResult = true;
      //text(resultIndex, x, y);
    }
    
    if (zauberlehrling.charAt(i) == ' ') {
      if(foundResult)
        stroke(c);
      else
        stroke(bgColor);

      line(x, y, x, y + 7);

      if (x + w < width - 10) {
        x += w;
      }
      else {
        x = 10;
        y += h;
      }
      
      foundResult = false;
    }
  }

  endRecord();
}

public static int findDuplicates(int a[], int b) {
  int value = a[b];
  int numOfDuplicates = 1;

  for (int i = 0 ; i < a.length;i++)
    if (a[i]==value)
      numOfDuplicates++;
  return numOfDuplicates ;
}


/*
 * this function will return indices for a given search term within 
 * the given source text
 * 
 * an int array will be returned, containing the number of results
 */
int[] find(String search, String sourceText) {
  int[] results = {
  };
  if (search.length() > 0) {  
    int start = sourceText.indexOf(search);
    while (start != -1) {
      results = append(results, start);
      start = sourceText.indexOf(search, start + search.length());
    }

    //println(results);
  }
  return results;
}


