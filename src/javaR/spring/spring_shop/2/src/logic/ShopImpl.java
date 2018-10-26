package logic;

import java.util.List;

public class ShopImpl implements Shop {

	private ItemCatalog itemCatalog;
	
	public void setItemCatalog(ItemCatalog itemCatalog) {
		this.itemCatalog = itemCatalog;
	}

	@Override
	public List<Item> getItemList() {

		return this.itemCatalog.getItemList();
	}

	@Override
	public Item getItemByItemId(Integer item_id) {
		return this.itemCatalog.getItemByItemId(item_id);
	}

}
