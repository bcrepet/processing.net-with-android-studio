import processing.net.*;

Server myServer;

int cX=0;
int cY=0;

void setup() {
  size(1000, 1000);
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
}

void draw() {
  background(0);
  Client thisClient = myServer.available();
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      println("message from client:" +whatClientSaid);
      String[] param = new String[3];
      param = split(whatClientSaid, ",");
      if(param[0].equals("coordclient")){
        cX=int(param[1]);
        cY=int(param[2]);
      }
    } 
  }
  ellipse(cX,cY,50,50);
}

void mouseReleased(){
    myServer.write("coordserver,"+mouseX+","+mouseY);
    cX=mouseX;
    cY=mouseY;
    println("x:"+mouseX+ " y:"+mouseY);
}
