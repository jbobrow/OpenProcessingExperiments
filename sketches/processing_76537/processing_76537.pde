
/**
Arranger
Reads a file and returns the words in it (1 per line).

@author Jose Salvatierra
@version 23 Oct 2012
*/
class Arranger {
  /**
   readFile(String)
   Reads the file and puts the words in an array.
   */
  public String[] readFile(String file) {
    BufferedReader reader = createReader(file);
    String line;
    List<String> words = new ArrayList<String>();
    try {
      while((line = reader.readLine()) != null) {
        words.add(line);
      }
    }
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    return words.toArray(new String[words.size()]);
  }
}

