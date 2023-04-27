import { LightningElement,wire, track } from 'lwc';
import getRecentAccounts from '@salesforce/apex/AccountController.getRecentAccounts';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' }
];
export default class ShowRecentAccounts extends LightningElement {
    accountList;
    columns = COLUMNS;
    @wire(getRecentAccounts)
    wiredAccountList({ error, data }) {
        if (data) {
            this.accountList = data;
        } else if (error) {
            console.error(error);
        }
    }
}