

// Processing sketch using the 'substitute' function
// See: http://rednoise.org/wdm/substitutor/

String choice = "Click for a Variation...";
String source = "The weather|view|food is really_nice|quite_good|very_attractive|bad in Hong_Kong|Bangkok|Japan.";


void setup() {

  size(500, 100);
  textAlign(CENTER);
  textFont(createFont("Times", 24));
}

void draw() {

  background(200);
  text(choice, width/2, height/2+12);
}

void mouseClicked() {

  choice = substitute(source);
}



/////////////////////////////////////////////////////////////////////

String substitute(String phrase) {

    if (phrase.indexOf('|') < 0) 
      return phrase;

    phrase = phrase.trim()
        .replaceAll("[\\s]+"," ")
        .replaceAll("[\\t\\r\\n]+", "");

    String[] words = phrase.split(" ");
    for (int i = 0; i < words.length; i++) {

        if (words[i].indexOf('|') > -1) {

            boolean endsWithPunc = false;
            char last = words[i].charAt(words[i].length()-1);

            if ("?;:.!".indexOf(last) > -1) {

                endsWithPunc = true;
                words[i] = words[i].substring(0,words[i].length()-1);
            }

            String[] opts = words[i].split("\\|");
            words[i] = opts[(int)(Math.random()*opts.length)];

            if (words[i] != null && words[i].length()>0) 
                if (endsWithPunc) words[i] += last;
        }
    }

    String result = "";
    for (int i = 0; i < words.length; i++)
      result += words[i] + " ";

    return result.trim()
        .replaceAll("\\s\\s+", " ")
        .replaceAll("_+", " ");
}
