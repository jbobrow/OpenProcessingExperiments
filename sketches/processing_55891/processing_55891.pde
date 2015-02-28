
StatusListener listener = new StatusListener() {

  public void onStatus(Status status) {

    String msg = status.getText();
    long id = status.getInReplyToStatusId();
    boolean isSolicited = false;


    if (id != -1) {
      isSolicited = true;
    }

    for (int i = 0; i < feelingWords.length; i++) {
      if (msg.contains(feelingWords[i])) {
         feelings[i].addTweet(msg,isSolicited);
      }    
     }

    isLoaded = true;
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
  }

  public void onTrackLimitationNotice(int numberOfLimitedStatus) {
  }

  public void onScrubGeo(long userId, long upToStatusId) {
  }

  public void onException(Exception ex) {
  }
};


