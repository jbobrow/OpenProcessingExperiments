
class Article {
  String URL;
  String resume;
  String titre;
  String date;

  Article(String titre, String resume, String URL, String date) {
    this.titre = titre;
    this.URL = URL;
    this.resume = resume;
    this.date = date;

    normaliserResume();
  }

  String getURL() {
    return URL;
  }

  String getTitre() {
    return titre;
  }

  String getResume() {
    return resume;
  }

  String getDate() {
    return date;
  }

  private void normaliserResume() {
    String [] extracteur = resume.split("<.*>");
    if (extracteur.length > 0)
      resume = extracteur[0];
  }
}


