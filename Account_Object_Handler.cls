public class Account_Object_Handler {
    public static void Chekbox_Parent_Object(List<Account> AccList){
        Map<Id,Account> AccListMap = new Map<Id , Account>();  
       // List<Account> AccChildUpdt1 = new List<Account>();
        List<Account> AccBackUp = New List<Account>();
        for(Account Accobj : AccList){
            if(Accobj.ParentId != null){
                Accobj.Parent_Account_Chekbox__c  = True;   
                AccListMap.put(Accobj.ParentId,Accobj);
            }   
        } 


         List<Account> AccListIds = [SELECT Id,name, Parent_Account_Chekbox__c FROM Account WHERE id IN : AccListMap.keyset() ];
         for(Account AccoParntChek : AccListIds ){
             if( AccoParntChek.Parent_Account_Chekbox__c != true){
                   AccoParntChek.Parent_Account_Chekbox__c = True ;
                    AccBackUp.add(AccoParntChek);
                }
                update AccoParntChek;
            }
    }
}
