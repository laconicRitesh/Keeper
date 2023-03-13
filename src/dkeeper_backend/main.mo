import List "mo:base/List";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DKeeper{
  
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNotes(titleText: Text, contentText: Text){
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };
    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNotes(id: Nat){
    let firsthalf = List.take(notes, id);
    let secondhalf = List.drop(notes, id+1);
    notes := List.append(firsthalf, secondhalf);
    //Debug.print(debug_show(notes));
  };
}