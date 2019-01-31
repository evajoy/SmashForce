public class CharacterPageController {
    public Id charId{
        get {
            if( charId == null) {
                charId = apexPages.currentPage().getParameters().get('charId');
            }
            return charId;
        }
        set;
    }
}