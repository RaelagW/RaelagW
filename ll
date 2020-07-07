#include <iostream>

using namespace std;a

template <class ll>
class LinkedList{
private:
    struct Node{
        ll data;
        Node *next;
        Node(ll data){
            this->data = data;
            this->next = NULL;
        }
    };
    Node *head, *tail;
    int nCounter;
public:
    LinkedList(){
        head = tail = NULL;
        nCounter = 0;
    }
    bool isEmpty(){return nCounter == 0;}
    void addAtHead(ll data){
        Node *newNode = new Node(data);
        if(isEmpty()) head = tail = newNode;
        else{
            newNode->next = head;
            head = newNode;
        }
        ++nCounter;
    }
    void addAtTail(ll data){
        Node *newNode = new Node(data);
        if(isEmpty()) head = tail = newNode;
        else{
            tail->next = newNode;
            tail = newNode;
        }
        ++nCounter;
    }
    void add(int loc, ll data){
        if(loc < 0 || loc > nCounter){
            cout << "Error!" << endl;
            return;
        }else if(loc == 0)addAtHead(data);
        else if (loc == nCounter - 1)addAtTail(data);
        else{
            Node *newNode = new Node(data);
            Node *temp = head;
            for(int i = 1; i < loc && temp != NULL; ++i) temp = temp->next;
            newNode->next = temp->next;
            temp->next = newNode;
            ++nCounter;
        }
    }
    void deleteAtHead(){
        if(isEmpty()){
            cout << "LinkedList is empty!" << endl;
            return;
        }else{
            if(head == tail) head = tail = NULL;
            else{
                Node *temp = head;
                head = head->next;
                delete temp;
            }
            --nCounter;
        }
    }
    void deleteAtTail(){
        if(isEmpty()){
            cout << "LinkedList is empty!" << endl;
            return;
        }else{
            if (head == tail) head = tail = NULL;
            else{
                Node *temp = head;
                while(temp->next != tail) temp = temp->next;
                tail = temp;
                temp = temp->next;
                tail->next = NULL;
                delete temp;
            }
            --nCounter;
        }
    }
    void deleteAtLoc(int loc){
        if(loc < 0 || loc > nCounter - 1){
            cout << "Error" << endl;
            return;
        }else if (loc == 0)deleteAtHead();
        else if(loc == nCounter - 1) deleteAtTail();
        else{
            Node *temp = head;
            for(int i = 1; i < loc && temp != NULL; ++i) temp = temp->next;
            if(temp == NULL ) return;
            else{
                Node *temp2 = temp->next;
                temp->next= temp2->next;
                temp2->next = NULL;
                delete temp2;
            }
            --nCounter;
        }
    }
    void print(){
        if(isEmpty()){
            cout << "LinkedList is empty!" << endl;
            return;
        }else{
            Node *temp = head;
            while(temp != NULL){
                cout << temp->data << " ";
                temp = temp->next;
            }
        }
    }
};

int main(){
    return 0;
}
